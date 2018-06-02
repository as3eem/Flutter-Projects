import 'package:flutter/material.dart';

class HelloRectangle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Container(
        color: Colors.green,
        height: 400.0,
        width: 300.0,
        child: new Center(
          child: Text('HEllO RECTANGLE',style: TextStyle(fontSize: 40.0),
          ),
        ),
    ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent   ,
          title: Text('Experiments with Flutter'),
        ),
          body: HelloRectangle(),
      ),
    ),
  );
}
