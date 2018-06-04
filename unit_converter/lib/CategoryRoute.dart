import 'package:flutter/material.dart';
import 'package:unit_converter/Category.dart';

final _backgroundColor=Colors.green[100];

class CategoryRoute extends StatelessWidget{
  const CategoryRoute();

  static const _categoryNames= <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors= <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _buildCategoryWidgets(List<Widget> categories){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index)=>categories[index],
    );
  }
}