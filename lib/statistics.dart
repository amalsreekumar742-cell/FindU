import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';



class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> hours = [4.0, 4.2, 3.8, 4.5, 4.0, 3.7, 5.6];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF6F7FB),
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
        title: const Text(
          "Statistics",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "This Week",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            // TIME SPENT CARD WITH CHART
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TIME SPENT",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "31.8 hours",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 140,
                    child: BarChart(
                      BarChartData(
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              getTitlesWidget: (value, _) {
                                const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
                                return Text(
                                  days[value.toInt()],
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                        ),
                        barGroups: List.generate(hours.length, (i) {
                          return BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                toY: hours[i],
                                color: Colors.blueAccent,
                                width: 14,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            const Text(
              "My Performance",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            // Performance Cards
            PerformanceCard(
              color: const Color(0xFFE8F1FF),
              icon: Icons.timer,
              title: "TIME SPENT",
              value: "31.8 hours",
            ),
            PerformanceCard(
              color: const Color(0xFFFFF4E5),
              icon: Icons.bar_chart,
              title: "AVERAGE/DAY",
              value: "4.6 hours",
            ),
            PerformanceCard(
              color: const Color(0xFFE9FBE5),
              icon: Icons.check_circle,
              title: "FINISHED COURSES",
              value: "12 courses",
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String value;

  const PerformanceCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: Colors.black54),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      ),
    );
  }
}
