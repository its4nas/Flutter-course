import 'package:first_test/view/login.dart';
import 'package:first_test/repositories/UserRepository.dart';
import 'package:flutter/material.dart';

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurple],
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 120.0),
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
                            validator: (value) {
                              if (value == null) return "First name cannot be empty";

                              if (value != null) {
                                if (value.length < 2) return "First name must be more than 1 letter";
                              }
                            },
                            controller: _firstNameController,
                            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
                              hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
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
                            validator: (value) {
                              if (value == null) return "Last name cannot be empty";

                              if (value != null) {
                                if (value.length < 2) return "Last name must be more than 1 letter";
                              }
                            },
                            controller: _lastNameController,
                            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
                              hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
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
                      validator: (value) {
                        if (value == null) return "Value is null";

                        if (value != null) {
                          if (value.length < 12) return "Text length must be more than 12 letters";
                        }
                      },
                      controller: _emailController,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
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
                      validator: (value) {
                        if (value == null) return "Phone cannot be empty";

                        if (value != null) {
                          if (value.length < 9) return "Phone length must be more than 9 numbers";
                        }
                      },
                      controller: _phoneController,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
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
                      validator: (value) {
                        if (value == null) return "Password cannot be empty";

                        if (value != null) {
                          if (value.length < 6) return "Password must be at least 6 characters long";
                        }
                      },
                      controller: _passwordController,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
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
                  SizedBox(height: 16.0),
                  isError
                      ? Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  )
                      : SizedBox(),
                  isSuccess
                      ? Text(
                    success,
                    style: TextStyle(color: Colors.green),
                  )
                      : SizedBox(),
                  SizedBox(height: 16.0),
                  loading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        var data = {
                          "firstName":_firstNameController.text,
                          "lastName":_lastNameController.text,
                          "email":_emailController.text,
                          "Phone":_phoneController.text,
                          "password":_passwordController.text,
                        };

                        var _result = await user_repository().add_user(data);
                        if (_result != null) {
                          setState(() {
                            loading = false;
                            isSuccess = true;
                            success = "Registration successful! Please log in.";
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage(toggleTheme: (){},)),
                          );
                        } else {
                          setState(() {
                            loading = false;
                            isError = true;
                            error = "Registration failed. Please try again.";
                          });
                        }
                      }
                    },
                    child: Text(
                      'ٍSign up',
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
                    child: Text(
                      'Already have an account? Log in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(toggleTheme:() {},)),
                      );
                    },
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