import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import '../view/Home.dart';
import 'login.dart';
import 'profile.dart';
import 'settings.dart';

class MainPage extends StatefulWidget {
  final UserModel? profile;
  final VoidCallback toggleTheme;

  const MainPage({Key? key, required this.toggleTheme, required this.profile}) : super(key: key);


  @override
  _MainPageState createState() => _MainPageState(profile: profile,toggleTheme: toggleTheme);
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final VoidCallback toggleTheme;
  UserModel? profile;

  _MainPageState({required this.profile, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ShowAll(),
      ProfilePage(profile: profile),
      SettingsPage(toggleTheme: toggleTheme),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Ez'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/ic_launcher.png'),
                  ),
                  SizedBox.fromSize(size: Size.fromWidth(10.0)),
                  Text(
                    '${profile?.firstName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MainPage()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(toggleTheme: toggleTheme,)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // backgroundColor: Colors.deepPurpleAccent,
        fixedColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}