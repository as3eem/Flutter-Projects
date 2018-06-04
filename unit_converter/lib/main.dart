import 'package:flutter/material.dart';
import 'package:unit_converter/Category.dart';
import 'package:unit_converter/CategoryRoute.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}