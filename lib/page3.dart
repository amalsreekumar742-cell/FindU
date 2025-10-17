import 'package:flutter/material.dart';
import 'package:flutter_application_1/video.dart';

class Page33 extends StatelessWidget {
  final Function(Map<String, String>) onSaveToggle;

  const Page33({super.key, required this.onSaveToggle});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> categories = {
      "Sales": [
        {
          "title": "Become a Photographer",
          "teacher": "Anu",
          "image": "https://images.pexels.com/photos/1264210/pexels-photo-1264210.jpeg",
          "progress": 0.69,
          "sections": [
            {
              "title": "Introduction",
              "videos": [
                {
                  "title": "Welcome",
                  "duration": "1m 45s",
                  "path": "asset/video/nature.mp4"
                }
              ]
            }
          ],
        },
        {
          "title": "Digital Marketing Learning",
          "teacher": "Annmariya",
          "image": "https://digitallearning.eletsonline.com/wp-content/uploads/2019/04/Digital-Marketing.jpg",
          "progress": 0.27,
          "sections": [
             {
              "title": "Introduction",
              "videos": [
                {
                  "title": "Welcome",
                  "duration": "1m 45s",
                  "path": "asset/video/nature.mp4"
                }
              ]
            }
          ],
        },
      ],
      "Developing": [
        {
          "title": "How to learn Python",
          "teacher": "John",
          "image": "https://cdn.bap-software.net/2024/06/20164527/where-to-find-great-python-developers.jpg",
          "progress": 0.84,
          "sections": [ {
              "title": "Introduction",
              "videos": [
                {
                  "title": "Welcome",
                  "duration": "1m 45s",
                  "path": "asset/video/nature.mp4"
                }
              ]
            },
             {
              "title": "Developer",
              "videos": [
                {
                  "title": "Welcome",
                  "duration": "1m 45s",
                  "path": "asset/video/nature.mp4"
                }
              ]
            }
            ],
        },
        {
          "title": "Flutter app development",
          "teacher": "Juvan",
          "image": "https://cdn.prod.website-files.com/646497e9af65ec660cdb5328/65d8c2bc53691cc47bc5064f_Cover_Flutter.webp",
          "progress": 0.72,
          "sections": [ {
              "title": "Introduction",
              "videos": [
                {
                  "title": "Welcome",
                  "duration": "1m 45s",
                  "path": "asset/video/nature.mp4"
                }
              ]
            }],
        },
      ],
      "Creative": [
        {
          "title": "Creative Thinking",
          "teacher": "Jose",
          "image": "https://thumbs.dreamstime.com/b/creative-thinking-ideas-innovation-concept-logical-idea-silhouette-man-light-bulb-his-brain-copy-space-dark-317029948.jpg",
          "progress": 0.45,
          "sections": [ {
              "title": "Introduction",
              "videos": [
                {
                  "title": "Welcome",
                  "duration": "1m 45s",
                  "path": "asset/video/nature.mp4"
                }
              ]
            }],
        },
        {
          "title": "Graphic Designing",
          "teacher": "Varun",
          "image": "https://images.stockcake.com/public/3/9/1/3913ebb1-633d-4f54-a808-b33887022e25_large/creative-digital-workspace-stockcake.jpg",
          "progress": 0.56,
          "sections": [ {
              "title": "Introduction",
              "videos": [
                {
                  "title": "Welcome",
                  "duration": "1m 45s",
                  "path": "asset/video/nature.mp4"
                }
              ]
            }],
        },
      ],
    };

    final tabs = categories.keys.toList();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
          bottom: TabBar(
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            final courses = categories[tab]!;

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return InkWell(
                  onTap: () {
                    // Tap the course card to open details (VideoApps)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoApps(
                          val1: course["title"],
                          val2: course["image"],
                          val3: course["teacher"],
                          sections: course["sections"],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 3,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          child: Image.network(
                            course["image"],
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course["title"],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  course["teacher"],
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                const SizedBox(height: 10),
                                LinearProgressIndicator(
                                  value: course["progress"],
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                  backgroundColor: Colors.grey[300],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "${(course["progress"] * 100).toInt()}% complete",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: const Icon(Icons.bookmark_add),
                            onPressed: () {
                              final Map<String, String> courseData = {
                                "title": course["title"].toString(),
                                "teacher": course["teacher"].toString(),
                                "image": course["image"].toString(),
                              };
                              onSaveToggle(courseData); // save to central list
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
