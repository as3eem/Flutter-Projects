import 'package:flutter/material.dart';

class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("blabla"),),
      body: new Container(
        color: Colors.green,
      ),
    );
  }
}
