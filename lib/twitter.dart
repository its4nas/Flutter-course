import 'package:flutter/material.dart';

import 'tw_test.dart';

class TwitterMainPage extends StatefulWidget {
  @override
  _TwitterMainPageState createState() => _TwitterMainPageState();
}

class _TwitterMainPageState extends State<TwitterMainPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ez'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle floating action button press
        },
        child: Icon(Icons.add),
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
                    return EzPostCard(username: 'Anas', content: 'this is some content', timestamp: '1 hr ago', comments: ["nigga","nigger"],);
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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TwitterPostCard(
            username: 'John Doe',
            content: 'This is a tweet example.',
            timestamp: '1h ago',
            comments: ['Comment 1', 'Comment 2', 'Comment 3'],
          );
        },
        itemCount: 5, // Replace with the actual number of tweets
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

class TwitterPostCard extends StatefulWidget {
  final String username;
  final String content;
  final String timestamp;
  final List<String> comments;

  TwitterPostCard({
    required this.username,
    required this.content,
    required this.timestamp,
    required this.comments,
  });

  @override
  _TwitterPostCardState createState() => _TwitterPostCardState();
}

class _TwitterPostCardState extends State<TwitterPostCard> {
  bool isLiked = false;
  int likesCount = 0;
  bool showAllComments = false;

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

  void _toggleShowAllComments() {
    setState(() {
      showAllComments = !showAllComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayedComments = showAllComments ? widget.comments :
    [widget.comments.first];

    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
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
              children: displayedComments
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
            if (widget.comments.length > 1)
              TextButton(
                onPressed: _toggleShowAllComments,
                child: Text(
                  showAllComments ? 'Hide comments' : 'View all comments',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
          ],
        ),
      ),
    );
  }
}