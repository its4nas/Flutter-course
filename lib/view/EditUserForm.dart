import 'package:first_test/models/UserModel.dart';
import 'package:flutter/material.dart';

import '../repositories/UserRepository.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key, required this.profile}) : super(key: key);
  final UserModel profile;

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  bool loading = false;
  bool isError = false;
  bool isSuccess = false;
  String error = "";
  String success = "";

  var formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _jobController;
  late TextEditingController _descriptionController;
  late TextEditingController _idController;
  late TextEditingController _likedController;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.profile.email);
    _passwordController = TextEditingController(text: widget.profile.password);
    _phoneController = TextEditingController(text: widget.profile.phone);
    _firstNameController = TextEditingController(text: widget.profile.firstName);
    _lastNameController = TextEditingController(text: widget.profile.lastName);
    _jobController = TextEditingController(text: widget.profile.job);
    _descriptionController = TextEditingController(text: widget.profile.description);
    _idController = TextEditingController(text: widget.profile.id.toString());
    _likedController = TextEditingController(text: widget.profile.liked.toString());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _jobController.dispose();
    _descriptionController.dispose();
    _idController.dispose();
    _likedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                        validator: (value) {
                          if (value == null) return "Last name cannot be empty";

                          if (value != null) {
                            if (value.length < 2) return "Last name must be more than 1 letter";
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
                  validator: (value) {
                    if (value == null) return "Value is null";

                    if (value != null) {
                      if (value.length < 12) return "Text length must be more than 12 letters";
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
                  validator: (value) {
                    if (value == null) return "Phone cannot be empty";

                    if (value != null) {
                      if (value.length < 9) return "Phone length must be more than 9 numbers";
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
                  validator: (value) {
                    if (value == null) return "Job cannot be empty";

                    if (value.length < 2)
                      return "Job length must be more than 2 numbers";

                    return null;
                  },
                  controller: _jobController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Job Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.shopping_bag),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null) return "Description cannot be empty";

                    if (value.length < 20)
                      return "Phone length must be more than 20 numbers";

                    return null;
                  },
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Job Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.note_alt),
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
                      "job":_jobController.text,
                      "description":_descriptionController.text,
                      "id":_idController.text,
                      "liked":_likedController.text,
                    };

                    var _result = await user_repository().update(data,widget.profile.id!);
                    if (_result != null) {
                      setState(() {
                        loading = false;
                        isSuccess = true;
                        success = "Profile updated successfully!";
                      });
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.deepPurple[300],
                          content: Text("User has been Updated seccesfully"),
                        ),
                      );
                    } else {
                      setState(() {
                        loading = false;
                        isError = true;
                        error = "Something went wrong, Please try again.";
                      });
                    }
                  }
                },
                child: Text('Confirm'),
              ),
              if (loading) CircularProgressIndicator(),
              if (isSuccess)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    success,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              if (isError)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),

    );

  }
}