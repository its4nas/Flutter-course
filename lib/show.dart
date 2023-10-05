import 'package:first_test/models/UserModel.dart';
import 'package:first_test/repositories/UserRepository.dart';
import 'package:flutter/material.dart';

class showall extends StatefulWidget {
  const showall({super.key});

  @override
  State<showall> createState() => _showallState();
}

class _showallState extends State<showall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("show test")),
      body: Container(
        child: FutureBuilder<List<UserModel>>(
          future: user_repository().getAllUsers(),
          builder: (context, snapshot)
          {
            if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator());
              }
            else if(snapshot.connectionState == ConnectionState.done)
              {
                if(snapshot.hasError)
                  {
                    return Center(child: Text("Error: ${snapshot.error.toString()}"));
                  }
                else if(snapshot.hasData)
                  {
                    var list = snapshot.data ?? [];
                    return ListView.separated(
                        itemBuilder: (context, index)
                      {
                        return  Card(
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/ic_launcher.png'),
                                      radius: 30.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "${list[index].id}",
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "${list[index].firstName} ${list[index].lastName}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  " kjfkd kdjfkl jjkdfjkljkl djkfjklsjfkldsjfklds",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      color: Colors.red,
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.share),
                                      color: Colors.deepPurple,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                        separatorBuilder: (context, index)
                      {
                        return Divider();
                      },
                        itemCount: list.length,
                    );
                  }
                else
                  {
                    return Center(child: Text("Error: ${snapshot.error.toString()}"));
                  }
              }
            else
              {
                return Center(child: Text("Error: ${snapshot.error.toString()}"));
              }
          }
          ,
        ),
      ),
    );
  }
}
