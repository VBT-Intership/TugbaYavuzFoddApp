import 'package:flutter/material.dart';

import 'foodView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp',
        home:FoodView(),
         
      );
  }
}
