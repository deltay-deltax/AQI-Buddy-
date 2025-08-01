import 'package:aqi_buddy/pages/bottomnav.dart';
import 'package:aqi_buddy/models/Aqitip.dart';
import 'package:aqi_buddy/pages/trendspage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  int? aqiValue;
  //highlightd =how to call a method from one page to next
  final void Function(int)? onTabChange; // Add this line
  final VoidCallback onLocationTap; //for  location
  final String? placeName;
  final bool? locationFetched;
  final String? airComponent;
  final Map<String, dynamic>? components;
  HomePage({
    super.key,
    required this.aqiValue,
    required this.onLocationTap,
    required this.placeName,
    required this.locationFetched,
    required this.airComponent,
    required this.components,
    required this.onTabChange,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getAqiCategory(int aqi) {
    switch (aqi) {
      case 1:
        return 'Good';
      case 2:
        return 'Fair';
      case 3:
        return 'Moderate';
      case 4:
        return 'Poor';
      case 5:
        return 'Very Poor';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    String aqiText =
        widget.aqiValue != null ? widget.aqiValue.toString() : '--';
    String category = getAqiCategory(widget.aqiValue ?? 0); // default to 0
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                GestureDetector(
                  onTap: widget.onLocationTap,

                  child: Icon(
                    Icons.location_on,
                    color:
                        (widget.locationFetched ?? false)
                            ? Colors.green
                            : Colors.grey, // dynamic color
                  ),
                ),

                const SizedBox(width: 10),
                Text(
                  widget.placeName ?? 'Fetching location...',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    (int.tryParse(aqiText) ?? 0) > 3
                        ? Border.all(color: Colors.deepOrange, width: 12)
                        : Border.all(color: Colors.green, width: 12),
              ),
              child: Center(
                child: Text(
                  aqiText,
                  style: TextStyle(
                    fontSize: 66,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              category,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            AQITipsWidget(aqiValue: widget.aqiValue ?? 1),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(179, 33, 149, 243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (widget.components != null) {
                    widget.onTabChange?.call(1); // navigate to Trends tab
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Components not yet loaded!")),
                    );
                  }
                },

                child: Text(
                  'View Trends',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
