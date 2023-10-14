import 'package:first_test/models/UserModel.dart';
import 'package:first_test/view/DeleteUserView.dart';
import 'package:first_test/view/EditUserForm.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final UserModel? profile;
  ProfilePage({required this.profile});



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
              '${profile?.firstName}',
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
                  '${profile?.liked} Likes',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              '${profile?.job}',
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
                        '${profile?.description}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return EditUser(profile: profile!);
                        })
                    );

                  },
                  child: Text('Edit Profile'),
                ),
                SizedBox(width: 50,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return DeleteUserView(userId: profile?.id??0);
                        })
                    );
                  },
                  child: Text('Delete Profile'),
                ),
              ],

            ),

          ],
        ),
      ),
    );
  }
}