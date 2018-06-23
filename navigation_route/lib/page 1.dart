import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String title;
  Page1(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Page 1"),
      ),
      body: new Center(
        child: new Text("Welcome to page 1"),

      ),
    );
  }
}
