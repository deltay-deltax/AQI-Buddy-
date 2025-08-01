import 'package:flutter/material.dart';

class AQITip {
  final IconData icon;
  final String text;

  AQITip({required this.icon, required this.text});
}

class AQITipsWidget extends StatelessWidget {
  final int aqiValue;

  const AQITipsWidget({super.key, required this.aqiValue});

  List<AQITip> getTipsForAQI(int aqi) {
    switch (aqi) {
      case 1: // Good
        return [
          AQITip(icon: Icons.check_circle, text: "Air quality is excellent."),
          AQITip(
            icon: Icons.directions_walk,
            text: "Enjoy outdoor activities.",
          ),
          AQITip(icon: Icons.eco, text: "Keep up eco-friendly habits."),
        ];
      case 2: // Fair
        return [
          AQITip(icon: Icons.air, text: "Air quality is acceptable."),
          AQITip(icon: Icons.nature_people, text: "Exercise with ease."),
          AQITip(icon: Icons.check, text: "No precautions needed."),
        ];
      case 3: // Moderate
        return [
          AQITip(icon: Icons.warning, text: "Sensitive people take care."),
          AQITip(
            icon: Icons.directions_run,
            text: "Limit intense exercise outdoors.",
          ),
          AQITip(icon: Icons.cloud, text: "Monitor air quality updates."),
        ];
      case 4: // Poor
        return [
          AQITip(icon: Icons.masks, text: "Wear a mask outside."),
          AQITip(icon: Icons.home, text: "Stay indoors if possible."),
          AQITip(icon: Icons.report, text: "Avoid crowded polluted areas."),
        ];
      case 5: // Very Poor
      default:
        return [
          AQITip(icon: Icons.dangerous, text: "Health warnings of emergency."),
          AQITip(
            icon: Icons.warning_amber,
            text: "Avoid all outdoor activities.",
          ),
          AQITip(icon: Icons.healing, text: "Seek medical help if unwell."),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<AQITip> tips = getTipsForAQI(aqiValue);

    return Column(
      children:
          tips.map((tip) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(tip.icon, color: Colors.lightBlue),
                title: Text(tip.text, style: const TextStyle(fontSize: 16)),
              ),
            );
          }).toList(),
    );
  }
}
