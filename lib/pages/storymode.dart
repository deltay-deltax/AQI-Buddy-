import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Storymode extends StatefulWidget {
  const Storymode({super.key});

  @override
  State<Storymode> createState() => _StorymodeState();
}

class _StorymodeState extends State<Storymode> {
  final List<String> imageUrls = [
    "Assets/images/clencity.jpg",
    "Assets/images/moderatecity.jpg",
    "Assets/images/pollutedcity.jpg",
  ];
  int currentindex = 0;
  void next() {
    setState(() {
      if (currentindex < imageUrls.length - 1) {
        currentindex++;
      } else {
        currentindex = 0;
      }
    });
  }

  void prev() {
    setState(() {
      if (currentindex > 0) {
        currentindex--;
      } else {
        currentindex = imageUrls.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Text(
              'STORIES',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 638,

              // width: 350,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      imageUrls[currentindex],
                      fit: BoxFit.fitHeight,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),

                  Positioned(
                    bottom: 80,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'The AQI is 1 - It\'s a perfect day ,\nyou can enjoy outside.\nGo for a walk🚶 ',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    width: 130,
                    bottom: 16,
                    left: 16,
                    child: ElevatedButton(
                      onPressed: prev,
                      child: Text(
                        'Prev',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    width: 130,
                    bottom: 16,
                    right: 16,
                    child: ElevatedButton(
                      onPressed: next,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.black54,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
