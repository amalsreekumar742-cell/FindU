import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/certificate.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoApps extends StatefulWidget {
  final String? val1; // Course Title
  final String? val2; // Course Image
  final String? val3; // Instructor
  final List<Map<String, dynamic>> sections; // Course Sections

  const VideoApps({
    super.key,
    this.val1,
    this.val2,
    this.val3,
    required this.sections,
  });

  @override
  State<VideoApps> createState() => _VideoAppsState();
}

class _VideoAppsState extends State<VideoApps> {
  VideoPlayerController? _controller;
  bool _isLoading = false;
  String currentVideoTitle = "";
  double _currentProgress = 0.0; // Overall course progress (0.0 to 1.0)
  Timer? _progressTimer;
  bool _isDialogShown = false; // ✅ Prevent multiple dialogs

  @override
  void initState() {
    super.initState();

    // Load the first video automatically
    if (widget.sections.isNotEmpty && widget.sections[0]['videos'].isNotEmpty) {
      final firstVideo = widget.sections[0]['videos'][0];
      currentVideoTitle = firstVideo["title"];
      _initializeVideo(firstVideo["path"]);
    }

    _loadSavedProgress();
  }

  /// Initialize a video by its path
  Future<void> _initializeVideo(String path) async {
    setState(() => _isLoading = true);
    try {
      if (_controller != null) {
        await _controller!.pause();
        await _controller!.dispose();
      }

      final newController = VideoPlayerController.asset(path); // or network
      await newController.initialize();

      setState(() {
        _controller = newController;
        _isLoading = false;
      });

      _controller!.play();
      _startProgressTracking();
    } catch (e) {
      debugPrint("Video initialization error: $e");
      setState(() => _isLoading = false);
    }
  }

  /// Load saved course progress from SharedPreferences
  Future<void> _loadSavedProgress() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('course_progress')) {
      final jsonString = prefs.getString('course_progress');
      final progressMap = Map<String, double>.from(json.decode(jsonString!));
      setState(() {
        _currentProgress = progressMap[widget.val1 ?? ""] ?? 0.0;
      });
    }
  }

  /// Track video progress periodically
  void _startProgressTracking() {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      if (_controller == null || !_controller!.value.isInitialized) return;
      final total = _controller!.value.duration.inSeconds;
      final pos = _controller!.value.position.inSeconds;
      if (total > 0) {
        final progress = pos / total;
        setState(() => _currentProgress = progress);
        await _saveProgress(progress);

        // ✅ When progress reaches ~100%, show alert once
        if (progress >= 0.99 && !_isDialogShown) {
          _isDialogShown = true;
          _showCompletionDialog();
        }
      }
    });
  }

  /// Save course progress
  Future<void> _saveProgress(double progress) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, double> progressMap = {};

    if (prefs.containsKey('course_progress')) {
      final jsonString = prefs.getString('course_progress');
      progressMap = Map<String, double>.from(json.decode(jsonString!));
    }

    progressMap[widget.val1 ?? ""] = progress;
    await prefs.setString('course_progress', json.encode(progressMap));
  }

  /// Show "Course Completed" dialog and navigate to Certificate
  void _showCompletionDialog() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastCompletedCourse', widget.val1 ?? "Unknown Course");

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("🎉 Congratulations!"),
        content: const Text(
          "You’ve completed this course! Visit the Certificates section to view your certificate.",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
             Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CertificatePage(courseTitle: widget.val1 ?? "Unknown Course"),
  ),
);

            },
            child: const Text("View Certificate"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context, _currentProgress);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.val1 ?? "Course Player"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Video Player
                if (_isLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 60),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (_controller != null && _controller!.value.isInitialized)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller!.value.isPlaying
                                ? _controller!.pause()
                                : _controller!.play();
                          });
                        },
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _controller!.value.isPlaying ? 0.0 : 1.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black45,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),

                const SizedBox(height: 16),

                /// Video Title
                Text(
                  currentVideoTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 16),

                /// Course Info
                Text(
                  widget.val1 ?? "No title available",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.val3 ?? "Instructor not available",
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),

                const SizedBox(height: 16),

                /// Progress Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Overall Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(
                      value: _currentProgress,
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                      backgroundColor: Colors.grey[300],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${(_currentProgress * 100).toStringAsFixed(1)}% completed",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  "Course Overview",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                /// Sections List
                ListView.builder(
                  itemCount: widget.sections.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, sectionIndex) {
                    final section = widget.sections[sectionIndex];
                    final sectionVideos =
                        List<Map<String, dynamic>>.from(section["videos"]);

                    return Card(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ExpansionTile(
                        tilePadding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        title: Text(
                          section["title"] ?? "Section",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        children: List.generate(
                          sectionVideos.length,
                          (videoIndex) {
                            final video = sectionVideos[videoIndex];

                            return ListTile(
                              leading: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.green,
                                size: 24,
                              ),
                              title: Text(video["title"] ?? "Video"),
                              trailing: Text(
                                video["duration"] ?? "",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              onTap: () {
                                setState(() {
                                  currentVideoTitle = video["title"];
                                });
                                _initializeVideo(video["path"]);
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
