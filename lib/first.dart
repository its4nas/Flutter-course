import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("AppBar", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        // leading: Text("Leading"),
        leading: Icon(Icons.search_sharp, color: Colors.white, size: 30,),
        actions: [
          Icon(Icons.add),
          Icon(Icons.alarm),
        ],
      ),
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        // ScaffoldMessenger.of()
      },
      child: Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}


