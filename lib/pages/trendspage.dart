import 'package:aqi_buddy/pages/bottomnav.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Trendspage extends StatelessWidget {
  final Map<String, dynamic>? components;
  const Trendspage({super.key, required this.components});

  @override
  Widget build(BuildContext context) {
    if (components == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationBarExample(),
                          ),
                        );
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Text(
                      '7-Day AQI Trends',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.filter_alt),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Pie Chart
              SizedBox(
                height: 300,
                width: 300,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 60,
                    sectionsSpace: 3,
                    startDegreeOffset: -90,
                    centerSpaceColor: Colors.white,
                    sections: [
                      PieChartSectionData(
                        value: components?['pm2_5'] ?? 0,
                        title: 'PM2.5',
                        color: Colors.deepPurple,
                        radius: 80,
                        titleStyle: pieTitleStyle,
                      ),
                      PieChartSectionData(
                        value: components?['pm10'] ?? 0,
                        title: 'PM10',
                        color: Colors.orangeAccent,
                        radius: 75,
                        titleStyle: pieTitleStyle,
                      ),
                      PieChartSectionData(
                        value: components?['co'] ?? 0,
                        title: 'CO',
                        color: Colors.lightBlue,
                        radius: 70,
                        titleStyle: pieTitleStyle,
                      ),
                      PieChartSectionData(
                        value: components?['no2'] ?? 0,
                        title: 'NO₂',
                        color: Colors.green,
                        radius: 70,
                        titleStyle: pieTitleStyle,
                      ),
                      PieChartSectionData(
                        value: components?['so2'] ?? 0,
                        title: 'SO₂',
                        color: Colors.redAccent,
                        radius: 65,
                        titleStyle: pieTitleStyle,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Component Values (μg/m³)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Table(
                  border: TableBorder.all(color: Colors.grey.shade300),
                  children: [
                    dataRow("PM2.5", components?['pm2_5']),
                    dataRow("PM10", components?['pm10']),
                    dataRow("CO", components?['co']),
                    dataRow("NO₂", components?['no2']),
                    dataRow("SO₂", components?['so2']),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  TableRow dataRow(String label, dynamic value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${value?.toStringAsFixed(2) ?? '--'}'),
        ),
      ],
    );
  }

  TextStyle get pieTitleStyle => const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}
