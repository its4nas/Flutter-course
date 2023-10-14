import 'package:first_test/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../repositories/UserRepository.dart';
import 'login.dart';

class DeleteUserView extends StatefulWidget {
  DeleteUserView({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  State<DeleteUserView> createState() => _DeleteUserViewState();
}

class _DeleteUserViewState extends State<DeleteUserView> {
  @override
  Widget build(BuildContext context) {

    bool loading = false;
    bool isError = false;
    bool isSuccess = false;
    String error = "";
    String success = "";

    return AlertDialog(
      title: Text('Delete Profile'),
      content: Container(
        constraints: BoxConstraints(
          maxWidth: 300,
          minWidth: 150,
          maxHeight: 250,
          minHeight: 100,
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("data"),
              loading?CircularProgressIndicator(): Text("Loading..."),
              isError? Text("Error: $error",style: TextStyle(color: Colors.red),):SizedBox(),
              isSuccess? Text("Added successfully"):SizedBox(),
              Row(
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Delete'),
                    onPressed: () async {
                      try
                      {
                        setState(() {
                          loading = true;
                          isSuccess = false;
                          isError = false;
                        });

                        var addRes = await user_repository().delete(widget.userId);
                        if(addRes > 0)
                        {
                          setState(() {
                            loading = false;
                            isSuccess = true;
                            isError = false;
                            error = "";
                          });
                          SystemNavigator.pop();
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
                    },
                  ),
                ],
              ),

            ],
          )
      )
    );
  }
}
