import 'package:first_test/models/UserModel.dart';
import 'package:first_test/repositories/UserRepository.dart';
import 'package:flutter/material.dart';

import 'ProfileInfo.dart';

class ShowAll extends StatefulWidget {
  const ShowAll({Key? key});

  @override
  _ShowAllState createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  List<UserModel> profileList = [];

  @override
  void initState() {
    super.initState();
    fetchProfiles();
  }

  void fetchProfiles() async {
    List<UserModel> profiles = await user_repository().getAllUsers();
    setState(() {
      profileList = profiles;
    });
  }
  String selectedFilter = 'All'; // Default filter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                  text: 'All',
                  isSelected: selectedFilter == 'All',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'All';
                    });
                  },
                ),
                FilterButton(
                  text: 'Software Engineer',
                  isSelected: selectedFilter == 'Software Engineer',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Software Engineer';
                    });
                  },
                ),
                FilterButton(
                  text: 'UIUX Designer',
                  isSelected: selectedFilter == 'UIUX Designer',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'UIUX Designer';
                    });
                  },
                ),

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: profileList.length,
              itemBuilder: (context, index) {
                UserModel profile = profileList[index];

                return ProfileCard(
                  profile: profile,
                  isLiked: profile.isLiked,
                  onLike: () {
                    setState(() {
                      setState(() {
                        if (profile.isLiked) {
                          profile.liked = profile.liked! -1;
                        } else {
                          profile.liked = profile.liked! +1;
                        }
                      });
                    });
                  },
                  onShare: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.deepPurple[300],
                        content: Text("Link of ${profileList[index].firstName} has copied"),
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
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final UserModel profile;
  final VoidCallback onLike;
  final VoidCallback onShare;
  final bool isLiked;

  const ProfileCard({
    required this.profile,
    required this.onLike,
    required this.onShare,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailPage(profile: profile),
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
                    "${profile.id} ${profile.job}",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                "${profile.firstName} ${profile.lastName}",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "${profile.description}",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${profile.liked}"),
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                    ),
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

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}