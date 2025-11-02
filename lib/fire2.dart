import 'package:flutter/material.dart';

class CourseDetailPage1 extends StatelessWidget {
  final Map<String, dynamic> course;

  CourseDetailPage1({required this.course});

  @override
  Widget build(BuildContext context) {
    List sections = [];
    if (course.containsKey('sections') && course['sections'] != null) {
      sections = List.from(course['sections']);
    }

    return Scaffold(
      appBar: AppBar(title: Text(course['title'] ?? "Course Detail")),
      body: sections.isEmpty
          ? Center(child: Text("No sections available"))
          : ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = Map<String, dynamic>.from(sections[index]);
                List videos = [];
                if (section.containsKey('videos') && section['videos'] != null) {
                  videos = List.from(section['videos']);
                }

                return ExpansionTile(
                  title: Text(section['title'] ?? 'No Section Title'),
                  children: videos.map<Widget>((video) {
                    final v = Map<String, dynamic>.from(video);
                    return ListTile(
                      leading: Icon(Icons.play_circle_fill),
                      title: Text(v['title'] ?? 'No Title'),
                      subtitle: Text(v['duration'] ?? ''),
                      onTap: () {
                        print("Play video path: ${v['path'] ?? ''}");
                      },
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}
