import 'package:first_test/profile.dart';
import 'package:flutter/material.dart';
import 'package:first_test/MainPage.dart';
import 'package:first_test/repositories/UserRepository.dart';
import 'package:first_test/signup.dart';
import 'package:first_test/models/UserModel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  List<UserModel> profileList = [];

  void fetchProfiles() async {
    List<UserModel> profiles = await user_repository().getAllUsers();
    setState(() {
      profileList = profiles;
    });
  }

  @override
  void initState() {
    fetchProfiles();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurple],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150.0),
              Image.asset("assets/images/ic_launcher.png", width: 100,),
              SizedBox(height: 16.0),
              Text(
                'Welcome to EzApp',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  UserModel? matchedUser;

                  for (var user in profileList) {
                    if (user.email == email && user.password == password) {
                      matchedUser = user;
                      break;
                    }
                  }

                  if (matchedUser != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return MainPage(profile: matchedUser,);
                      }),
                    );
                  } else {
                    print("Wrong email or password");
                  }
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Handle forgot password button press
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:(context) {
                      return SignupPage();
                    }),
                  );
                },
                child: Text(
                  'Do not have an account?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}