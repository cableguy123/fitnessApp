import 'package:flutter/material.dart';
import 'fitnessAll.dart';



class mealScreen extends StatefulWidget {
  const mealScreen({Key? key}) : super(key: key);
  @override
  State<mealScreen> createState() => _mealScreenState();
}

class _mealScreenState extends State<mealScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text('Hello Screen!'),
        ),
      ),
    );
  }
}
