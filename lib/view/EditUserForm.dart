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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Profile'),
      content: SingleChildScrollView(
      child: Container(
      constraints: BoxConstraints(
      maxWidth: 500,
      minWidth: 150,
      maxHeight: 800,
      minHeight: 100,
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.min,
    children: [
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
    if (value.length < 2)
      return "First name must be more than 1 letter";

    return null;
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

              if (value.length < 2)
                return "Last name must be more than 1 letter";

              return null;
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
            if (value == null) return "Email cannot be empty";

            if (value.length < 12)
              return "Email length must be more than 12 letters";

            return null;
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

            if (value.length < 9)
              return "Phone length must be more than 9 numbers";

            return null;
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

            if (value.length < 6)
              return "Password must be at least 6 characters long";

            return null;
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
                "job":_jobController.text,
                "description":_descriptionController.text,
                "id":_idController.text,
              };

              var addRes = await user_repository().update(data, widget.profile.id!);
              if(addRes > 0)
              {
                setState(() {
                  loading = false;
                  isSuccess = true;
                  isError = false;
                  error = "";
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.deepPurple[300],
                      content: Text("User has been Updated seccesfully"),
                    ),
                  );

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