import 'package:aqi_buddy/AQI_Service/aqidata.dart';
import 'package:aqi_buddy/AQI_Service/geolocation.dart';
import 'package:aqi_buddy/pages/bottomnav.dart';
import 'package:aqi_buddy/pages/home.dart';
import 'package:aqi_buddy/pages/settingpage.dart';
import 'package:aqi_buddy/pages/storymode.dart';
import 'package:aqi_buddy/pages/trendspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AQI Buddy',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}
