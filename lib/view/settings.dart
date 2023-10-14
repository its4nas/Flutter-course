import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  int selectedFontSizeIndex = 1;
  List<String> fontSizes = ['Small', 'Medium', 'Large'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 2.0,
            child: ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            child: ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    darkModeEnabled = value;
                  });
                },
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            child: ListTile(
              title: Text('Font Size'),
              trailing: DropdownButton<int>(
                value: selectedFontSizeIndex,
                items: fontSizes.map((fontSize) {
                  return DropdownMenuItem<int>(
                    value: fontSizes.indexOf(fontSize),
                    child: Text(fontSize),
                  );
                }).toList(),
                onChanged: (index) {
                  setState(() {
                    selectedFontSizeIndex = index!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}