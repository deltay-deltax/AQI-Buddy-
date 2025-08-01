import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),

      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                'General',

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.notifications, color: Colors.lightBlue),
                title: Text('Notifications', style: TextStyle(fontSize: 17)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ),
            Card(
              color: Color(0xffffffff),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.straighten, color: Colors.lightBlue),
                title: Text('Units', style: TextStyle(fontSize: 17)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.language, color: Colors.lightBlue),
                title: Text('Language', style: TextStyle(fontSize: 17)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                'Account',

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.person, color: Colors.lightBlue),
                title: Text('Profile', style: TextStyle(fontSize: 17)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.lock, color: Colors.lightBlue),
                title: Text('Privacy', style: TextStyle(fontSize: 17)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                'Support',

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.info, color: Colors.lightBlue),
                title: Text('About AQI Buddy', style: TextStyle(fontSize: 17)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.help, color: Colors.lightBlue),
                title: Text('Help & Feedback', style: TextStyle(fontSize: 17)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
