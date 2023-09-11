import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,

        leading: Icon(Icons.menu),
      ),
      body: 
          Row(
            children: [
              Text("data"),
              ListView(
                children: [
                  Text("viewList"),

                ],
              )
            ],
          )
     
      

    );
  }
}
