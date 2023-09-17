import 'package:flutter/material.dart';

import 'login.dart';

class EzPostCard extends StatefulWidget {
  final String username;
  final String content;
  final String timestamp;
  final List<String> comments;

  EzPostCard({
    required this.username,
    required this.content,
    required this.timestamp,
    required this.comments,
  });

  @override
  _EzPostCardState createState() => _EzPostCardState();
}

class _EzPostCardState extends State<EzPostCard> {
  bool isLiked = false;
  int likesCount = 0;

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likesCount--;
      } else {
        likesCount++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ez Post'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            CircleAvatar(child: Icon(Icons.person),),
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Row(
                children: [
                  CircleAvatar(child: Icon(Icons.person),
                  ),
                  Text(
                    'JohnDoe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle drawer item tap
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
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
      body: Card(
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    widget.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                widget.content,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.timestamp,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  IconButton(
                    icon: isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                    color: isLiked ? Colors.red : Colors.grey,
                    onPressed: _toggleLike,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '$likesCount',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Icon(
                    Icons.share,
                    size: 16.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Comments',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                children: widget.comments
                    .map(
                      (comment) => ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(comment),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}