import 'dart:io';
import 'package:first_test/models/UserModel.dart';
import 'package:first_test/view/DeleteUserView.dart';
import 'package:first_test/view/EditUserForm.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final UserModel? profile;

  ProfilePage({required this.profile});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _refreshing = false;

  Future<void> _refreshProfile() async {
    setState(() {
      _refreshing = true;
    });

    // Perform any necessary data fetching or refreshing logic here

    // Simulate a delay for demonstration purposes
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _refreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshProfile,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0),
              Text(
                '${widget.profile?.job}',
                style: TextStyle(
                  fontSize: 28.0,
                ),
              ),
              SizedBox(height: 50.0),
              ClipOval(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: widget.profile?.image != null
                      ? Image.file(
                    File(widget.profile!.image!),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'assets/images/default.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '${widget.profile?.firstName} ${widget.profile?.lastName}',
                style: TextStyle(
                  fontSize: 28.0,
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
                    '${widget.profile?.liked} Likes',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                "Phone: ${widget.profile?.phone}",
                style: TextStyle(
                  fontSize: 20.0,
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
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${widget.profile?.description}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return EditUser(profile: widget.profile!);
                          })
                      );

                    },
                    child: Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 50,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return DeleteUserView(userId: widget.profile?.id??0);
                          })
                      );
                    },
                    child: Text('Delete Profile'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              // Show a progress indicator while refreshing is in progress
              if (_refreshing)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}