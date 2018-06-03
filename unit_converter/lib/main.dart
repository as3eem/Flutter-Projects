import 'package:flutter/material.dart';
import 'package:unit_converter/Category.dart';

const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body:Center(
          child: Category(
            name: _categoryName,
            color: _categoryColor,
            iconLocation: _categoryIcon,
          ),
        ),
      ),
    );
  }
}
