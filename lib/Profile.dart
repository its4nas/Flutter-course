import 'package:first_test/twitter.dart';
import 'package:flutter/material.dart';
import 'tw_test.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
  int _followersCount = 1000;
  int _followingCount = 500;

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Map<String, String>> tweets = [
    {
      'username': 'JohnDoe',
      'postText': 'Hello, Twitter!',
      'imageUrl': '',
    },
    {
      'username': 'JaneSmith',
      'postText': 'Flutter is amazing!',
      'imageUrl': '',
    },
    // Add more tweets here...
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  CircleAvatar(child: Icon(Icons.person),),
                  Text(
                    ' Name',
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return EzMainPage();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Handle drawer item tap
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
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  radius: 50,
                ),
                SizedBox(height: 16),
                Text(
                  'Followers: $_followersCount',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 16),
                Text(
                  'Following: $_followingCount',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          AppBar(
            title: Text("Jobs"),
            centerTitle: true,
            leading: Icon(Icons.shopping_bag_outlined),
            backgroundColor: Colors.deepPurple,
            elevation: 0,
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              final tweet = tweets[index];
              return EzCard(
                username: tweet['username']!,
                postText: tweet['postText']!,
                imageUrl: tweet['imageUrl']!,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.deepPurple, // Set the background color
        selectedItemColor: Colors.deepPurple, // Set the selected item color
        unselectedItemColor: Colors.grey, // Set the unselected item color
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class EzCard extends StatelessWidget {
  final String username;
  final String postText;
  final String imageUrl;

  EzCard({
    required this.username,
    required this.postText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(width: 8.0),
                Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              postText,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}