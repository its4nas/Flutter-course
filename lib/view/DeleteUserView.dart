import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../repositories/UserRepository.dart';

class DeleteUserView extends StatefulWidget {
  DeleteUserView({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  State<DeleteUserView> createState() => _DeleteUserViewState();
}

class _DeleteUserViewState extends State<DeleteUserView> {
  @override
  Widget build(BuildContext context) {

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
              Text("Are you sure, You want to Delete your Account for ever?"),
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
                        });

                        var addRes = await user_repository().delete(widget.userId);
                        if(addRes > 0)
                        {
                          setState(() {

                          });
                          SystemNavigator.pop();
                        }
                        else
                        {
                          setState(() {
                              Navigator.of(context).pop();
                          });
                        }
                      }
                      catch(e)
                      {
                        setState(() {
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
