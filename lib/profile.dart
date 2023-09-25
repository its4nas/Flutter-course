import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final int numLikes;
  ProfilePage({required this.numLikes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/ic_launcher.png'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Anas Al-Dharei',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.red),
                SizedBox(width: 5.0),
                Text(
                  '$numLikes Likes',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Hi my name is Anas, I am a software Engineer. I live in Yemen with my family. I was born in 2001 so I am 23 years old. I love watching soccer and playing it. Finally F Messi',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality for editing the profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}