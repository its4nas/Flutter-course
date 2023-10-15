import 'package:first_test/view/login.dart';
import 'package:first_test/repositories/UserRepository.dart';
import 'package:flutter/material.dart';

import '../models/UserModel.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool loading = false;
  bool isError = false;
  bool isSuccess = false;
  String error = "";
  String success = "";


  var formKey = GlobalKey<FormState>();

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _phoneController = TextEditingController();
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  bool _isPasswordVisible = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height, // Set container height to full screen height
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurple],
            ),
          ),
    child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurple],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 120.0,),
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
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value)
                        {
                          if(value == null)
                            return "first name cannot be empty";

                          if(value!=null)
                          {
                            if(value.length < 2)
                              return "first name must be more than 1 letter";
                          }
                        },
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'First Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value)
                        {
                          if(value == null)
                            return "last name cannot be empty";

                          if(value!=null)
                          {
                            if(value.length < 2)
                              return "last name must be more than 1 letter";
                          }
                        },
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Last Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)
                  {
                    if(value == null)
                      return "Value is null";

                    if(value!=null)
                      {
                        if(value.length < 12)
                          return "Text length must be more than 12 letters";
                      }
                  },
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
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)
                  {
                    if(value == null)
                      return "phone cannot be empty";

                    if(value!=null)
                    {
                      if(value.length < 9)
                        return "phone length must be more than 9 numbers";
                    }
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)
                  {
                    if(value == null)
                      return "password cannot be null";

                    if(value!=null)
                    {
                      if(value.length < 9)
                        return "password must be more than 8 letters & numbers";
                    }
                  },
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              loading?CircularProgressIndicator(): TextButton(
                onPressed: ()async {
                  if(1==1)
                    {
                      try
                        {
                          setState(() {
                            loading = true;
                            isSuccess = false;
                            isError = false;
                          });
                          var data = {
                            "firstName":_firstNameController.text,
                            "lastName":_lastNameController.text,
                            "email":_emailController.text,
                            "Phone":_phoneController.text,
                            "password":_passwordController.text,
                          };

                          var addRes = await user_repository().add_user(data);
                          if(addRes > 0)
                            {
                              setState(() {
                                loading = false;
                                isSuccess = true;
                                isError = false;
                                error = "";
                              });
                            }
                          else
                            {
                              setState(() {
                                loading = false;
                                isSuccess = false;
                                isError = true;
                                error = "something went worng";
                              });
                            }
                        }
                      catch(e)
                        {
                          setState(() {
                            loading = false;
                            isSuccess = false;
                            isError = true;
                            error = "exp: ${e.toString()}";
                          });
                        }
                    }
                  else
                    {
                      print("Form is not Valid");
                    }
                },
                child: Text('Confirm', style: TextStyle(color: Colors.deepPurple, fontSize: 15, fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              isError? Text("Error: $error",style: TextStyle(color: Colors.red),):SizedBox(),
              isSuccess? Text("Added successfully",style: TextStyle(color: Colors.greenAccent),):SizedBox(),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return LoginPage();
                      })
                  );
                },
                child: Text(
                  'I already have an account',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    ),
    );
  }
}