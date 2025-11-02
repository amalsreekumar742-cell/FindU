import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CertificatePage extends StatefulWidget {
  final String? courseTitle;

  const CertificatePage({super.key, this.courseTitle});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  List<Map<String, dynamic>> _certificates = [];

  @override
  void initState() {
    super.initState();
    _loadCertificates();

    // ✅ If a new course is passed (from VideoApps)
    if (widget.courseTitle != null && widget.courseTitle!.isNotEmpty) {
      _addCertificate(widget.courseTitle!);
    }
  }

  Future<void> _loadCertificates() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('completedCertificates')) {
      final jsonString = prefs.getString('completedCertificates');
      final List decoded = json.decode(jsonString!);
      setState(() {
        _certificates = decoded.cast<Map<String, dynamic>>();
      });
    }
  }

  Future<void> _addCertificate(String title) async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> updatedList = [];

    if (prefs.containsKey('completedCertificates')) {
      final jsonString = prefs.getString('completedCertificates');
      updatedList =
          List<Map<String, dynamic>>.from(json.decode(jsonString!));
    }

    final exists = updatedList.any((c) => c['title'] == title);
    if (!exists) {
      updatedList.add({
        'title': title,
        'date': DateTime.now().toString().split(' ')[0],
      });

      await prefs.setString('completedCertificates', json.encode(updatedList));
      setState(() {
        _certificates = updatedList;
      });
    }
  }

  Future<void> _clearCertificates() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('completedCertificates');
    setState(() {
      _certificates = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Certificates"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearCertificates,
            tooltip: "Clear All (for testing)",
          ),
        ],
      ),
      body: _certificates.isEmpty
          ? const Center(
              child: Text(
                "No certificates received yet 🎓",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _certificates.length,
              itemBuilder: (context, index) {
                final cert = _certificates[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.workspace_premium,
                        color: Colors.amber, size: 36),
                    title: Text(
                      cert['title'] ?? "Unknown Course",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Received on ${cert['date']}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CertificateViewPage(
                              courseTitle: cert['title'],
                              date: cert['date'],
                            ),
                          ),
                        );
                      },
                      child: const Text("View"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

/// 🎓 Certificate View Page (Pretty Design)
class CertificateViewPage extends StatelessWidget {
  final String courseTitle;
  final String date;

  const CertificateViewPage({
    super.key,
    required this.courseTitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Certificate Preview"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.amber, width: 4),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.workspace_premium,
                  size: 100, color: Colors.amber),
              const SizedBox(height: 10),
              const Text(
                "Certificate of Completion",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Divider(
                color: Colors.amber,
                thickness: 2,
                height: 30,
                indent: 50,
                endIndent: 50,
              ),
              const Text(
                "This is proudly presented to",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 10),
              const Text(
                "John Doe", // 👤 Replace with actual user name if available
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "for successfully completing the course",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Text(
                "\"$courseTitle\"",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Date: $date",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Downloading certificate..."),
                    ),
                  );
                },
                icon: const Icon(Icons.download),
                label: const Text("Download Certificate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
