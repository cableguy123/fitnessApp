import 'package:flutter/material.dart';
import 'fitnessAll.dart';

class statisticsScreen extends StatefulWidget {
  const statisticsScreen({Key? key}) : super(key: key);
  @override
  State<statisticsScreen> createState() => _statisticsScreenState();
}

class _statisticsScreenState extends State<statisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Hello Statistics Screen!')
        ),
      ),
    );
  }
}
