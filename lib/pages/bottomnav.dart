import 'package:aqi_buddy/pages/home.dart';
import 'package:aqi_buddy/pages/settingpage.dart';
import 'package:aqi_buddy/pages/storymode.dart';
import 'package:aqi_buddy/pages/trendspage.dart';
import 'package:flutter/material.dart';
import 'package:aqi_buddy/AQI_Service/aqidata.dart';
import 'package:aqi_buddy/AQI_Service/geolocation.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int? aqi;
  Map<String, dynamic>? components;
  String? _placeName;
  double? _latitude;
  double? _longitude;
  int _selectedIndex = 0;

  late List<Widget> pages;

  @override
  @override
  void initState() {
    super.initState();

    // Initialize pages with placeholders to avoid late initialization error
    pages = [
      const Center(child: CircularProgressIndicator()),
      const Center(child: CircularProgressIndicator()),
      const Center(child: CircularProgressIndicator()),
      const Center(child: CircularProgressIndicator()),
    ];

    getLocation().then((_) => fetchAQIData());
  }

  void fetchAQIData() async {
    if (_latitude != null && _longitude != null) {
      final result = await AQIService.fetchAQIData(
        latitude: _latitude!,
        longitude: _longitude!,
      );

      setState(() {
        aqi = result?['aqi'];
        components = result?['components'];
        pages = [
          HomePage(
            aqiValue: aqi,
            airComponent: 'PM2.5',
            onLocationTap: getLocation,
            placeName: _placeName,
            locationFetched: _latitude != null && _longitude != null,
            components: components,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Trendspage(components: components),
          Storymode(),
          SettingPage(),
        ];
      });
    }
  }

  Future<void> getLocation() async {
    final position = await LocationService.getCurrentLocation();
    if (position != null) {
      final place = await LocationService.getPlaceName(position);
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _placeName = place;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.lightBlue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Trends'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Story'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body:
          pages.isNotEmpty
              ? pages[_selectedIndex]
              : Center(child: CircularProgressIndicator()),
    );
  }
}
