import 'package:flutter/material.dart';
import 'ProfileInfo.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewListPage extends StatefulWidget {
  @override
  _ViewListPageState createState() => _ViewListPageState();
}

class _ViewListPageState extends State<ViewListPage> {
  List<Profile> profileList = [
    Profile(
      name: 'Anas Al-Dharei',
      jobTitle: 'Software Engineer',
      about: 'Hi my name is Anas, I am a software Engineer. I live in Yemen with my family. I was born in 2001 so I am 23 years old. I love watching soccer and playing it. Finally F Messi',
    ),
    Profile(
      name: 'MO Al-Dharei',
      jobTitle: 'UIUX Designer',
      about: 'Hi my name is Anas, I am a UIUX Designer. I live in Yemen with my family. I was born in 2001 so I am 23 years old. I love watching soccer and playing it. Finally F Messi',
    ),
    Profile(
      name: 'David Johnson',
      jobTitle: 'UX Designer',
      about: 'Phasellus eu tellus nec nulla dapibus suscipit. Sed vel faucibus mauris. Morbi non felis sit amet orci tristique fringilla eu eu metus. Donec ut mi sed nisl elementum accumsan.',
    ),
    Profile(
      name: 'David Johnson',
      jobTitle: 'UX Designer',
      about: 'Phasellus eu tellus nec nulla dapibus suscipit. Sed vel faucibus mauris. Morbi non felis sit amet orci tristique fringilla eu eu metus. Donec ut mi sed nisl elementum accumsan.',
    ),
    Profile(
      name: 'Anas Al-Dharei',
      jobTitle: 'Software Engineer',
      about: 'Hi my name is Anas, I am a software Engineer. I live in Yemen with my family. I was born in 2001 so I am 23 years old. I love watching soccer and playing it. Finally F Messi',
    ),
    Profile(
      name: 'MO Al-Dharei',
      jobTitle: 'UIUX Designer',
      about: 'Hi my name is Anas, I am a UIUX Designer. I live in Yemen with my family. I was born in 2001 so I am 23 years old. I love watching soccer and playing it. Finally F Messi',
    ),
    Profile(
      name: 'David Johnson',
      jobTitle: 'UX Designer',
      about: 'Phasellus eu tellus nec nulla dapibus suscipit. Sed vel faucibus mauris. Morbi non felis sit amet orci tristique fringilla eu eu metus. Donec ut mi sed nisl elementum accumsan.',
    ),
    Profile(
      name: 'David Johnson',
      jobTitle: 'UX Designer',
      about: 'Phasellus eu tellus nec nulla dapibus suscipit. Sed vel faucibus mauris. Morbi non felis sit amet orci tristique fringilla eu eu metus. Donec ut mi sed nisl elementum accumsan.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: profileList.length,
        itemBuilder: (context, index) {
          return ProfileCard(
            profile: profileList[index],
            onLike: () {
              setState(() {
                profileList[index].liked = !profileList[index].liked;
              });
            },
            onShare: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.deepPurple[300],
                  content: Text("Link of ${profileList[index].name} has copied"),
                  action: SnackBarAction(
                    label: 'Close',
                    onPressed: () {
                      // Code to execute.
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Profile {
  final String name;
  final String jobTitle;
  final String about;
  bool liked;

  Profile({required this.name, required this.jobTitle, required this.about, this.liked = false});
}

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final VoidCallback onLike;
  final VoidCallback onShare;

  ProfileCard({required this.profile, required this.onLike, required this.onShare});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailPage(profile: profile, numLikes: 25),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/ic_launcher.png'),
                    radius: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    profile.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                profile.jobTitle,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                profile.about,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(profile.liked ? Icons.favorite : Icons.favorite_border),
                    color: Colors.red,
                    onPressed: onLike,
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    color: Colors.deepPurple,
                    onPressed: onShare,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
