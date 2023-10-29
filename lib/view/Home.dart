import 'dart:io';
import 'package:first_test/models/UserModel.dart';
import 'package:first_test/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'ProfileInfo.dart';

class ShowAll extends StatefulWidget {
  const ShowAll({Key? key});

  @override
  _ShowAllState createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  List<UserModel> profileList = [];
  List<UserModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    fetchProfiles();
  }

  void fetchProfiles() async {
    List<UserModel> profiles = await user_repository().getAllUsers();
    setState(() {
      profileList = profiles;
      filteredList = profiles;
    });
  }

  void searchByName(String query) {
    setState(() {
      filteredList = profileList.where((profile) {
        final fullName = '${profile.firstName} ${profile.lastName} ${profile.job}'.toLowerCase();
        return fullName.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      searchByName(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search by name or job',
                      prefixIcon: Icon(Icons.search,color: Colors.deepPurple,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                UserModel profile = filteredList[index];
                return ProfileCard(
                  profile: profile,
                  onLike: () {
                    setState(() {
                      setState(() {
                        if (profile.isLiked)
                        {
                          profile.liked = profile.liked! -1;
                        } else
                        {
                          profile.liked = profile.liked! +1;
                        }
                      });
                    });
                  },
                  onShare: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.deepPurple[300],
                        content: Text("Link of ${profileList[index].firstName} has copied", style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),),
                        action: SnackBarAction(
                          label: 'Close',
                          onPressed: () {
                            // Code to execute.
                          },
                        ),
                      ),
                    );
                  },
                  isLiked: profile.isLiked,
                  // ... Other properties
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
      child: Column(
        children: [
          if(profile.job != "watcher")
          Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child:
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: profile?.image != null
                            ? Image.file(
                          File(profile!.image!),
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        )
                            : Image.asset(
                          'assets/images/default.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "${profile.firstName} ${profile.lastName}",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "${profile.job}",
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
                        color: Colors.deepPurpleAccent,
                        onPressed: onShare,
                      ),
                    ],
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