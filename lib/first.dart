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
        backgroundColor: Colors.red,
        title: Text("AppBar", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        // leading: Text("Leading"),
        // leading: Icon(Icons.search_sharp, color: Colors.white, size: 30,),
        actions: [
          Icon(Icons.add),
          Icon(Icons.alarm),
        ],
      ),
      backgroundColor: Colors.white,

      body: Container(
        color: Colors.yellow,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue,
              width: 100,
              height: 60,

              child: Text("thing"),
            ),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
          ],
        ),
      ),

      drawer:
        Drawer(
        width: MediaQuery.of(context).size.width * 0.50,
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        // ScaffoldMessenger.of(context).
      },
      child: Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}


