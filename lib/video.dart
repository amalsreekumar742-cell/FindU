import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApps extends StatefulWidget {
  final String? val1; // Course Title
  final String? val2; // Image
  final String? val3; // Instructor
  
  final List<Map<String, dynamic>> sections; // Full course sections

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

  @override
  void initState() {
    super.initState();

    // Load first video by default
    final firstVideo = widget.sections[0]["videos"][0];
    _initializeVideo(firstVideo["path"]);
    currentVideoTitle = firstVideo["title"];
  }

  Future<void> _initializeVideo(String path) async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_controller != null) {
        await _controller!.pause();
        await _controller!.dispose();
      }

      final newController = VideoPlayerController.asset(path);
      await newController.initialize();

      setState(() {
        _controller = newController;
        _isLoading = false;
      });

      _controller!.play();
    } catch (e) {
      debugPrint("Video initialization error: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              else if (_controller != null &&
                  _controller!.value.isInitialized)
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
                widget.val3 ??
                    "No course description provided. Please check again later.",
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),

              const SizedBox(height: 16),

              Row(
                children: const [
                  Icon(Icons.timer, color: Colors.grey),
                  SizedBox(width: 8),
                  Text("Duration: 10 min"),
                  SizedBox(width: 16),
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 8),
                  Text("4.8 Rating"),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Course Overview",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              /// Course Sections
              ListView.builder(
                itemCount: widget.sections.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, sectionIndex) {
                  final section = widget.sections[sectionIndex];

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      title: Text(
                        section["title"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      children: List.generate(
                        section["videos"].length,
                        (videoIndex) {
                          final video = section["videos"][videoIndex];

                          return ListTile(
                            leading: const Icon(
                              Icons.play_circle_fill,
                              color: Colors.green,
                              size: 24,
                            ),
                            title: Text(video["title"]),
                            trailing: Text(
                              video["duration"],
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
    );
  }
}
