import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'mealdetails.dart';
import 'statistics.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'palette.dart';
import 'calendar.dart';
class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);
  @override
  State<mainScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<mainScreen> {
  bool isActivedTab = false;
  int indexNum = -1;
  Color enableColor = const Color.fromRGBO(128, 128, 128,1.0);
  Color disableColor = const Color.fromRGBO(0, 0, 0, 1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
          backgroundColor: Colors.white,
          leading: TextButton(onPressed: () {
              setState(() {
                indexNum = 0;
              });
              Navigator.push(context,MaterialPageRoute(builder: (context) => const mainScreen()));
            },
            child: Text('기록',style: TextStyle(color: indexNum == 0 ? enableColor : disableColor ),),
          ),
          title: Row(
            children: <Widget> [
              TextButton(onPressed: () {
                setState(() {
                  indexNum = 1;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => const statisticsScreen()));
              },
                  child: Text('통계',style: TextStyle(color: indexNum == 1 ? enableColor : disableColor),),
              ),
              const SizedBox(width: 5),
              TextButton(onPressed: () {
                setState(() {
                  indexNum = 2;
                });
                Navigator.push(context,MaterialPageRoute(builder: (context) => const mealScreen()));
              },
                  child: Text('식단 상세',style: TextStyle(color: indexNum == 2 ? enableColor : disableColor),)),
              ],
          ),
          bottom: TabBar(
            tabs: <Widget> [
              Tab(
                  icon: const Icon(Icons.arrow_left),
                ),
              Tab(
                icon: const Icon(Icons.sentiment_satisfied),
                child: TextButton(
                  onPressed: () {
                    calendScreen();
                  },
                  child: Text('$}')
                ),
              ),
              Tab(
                icon: const Icon(Icons.arrow_right),
              )
            ],
          ),
        ),
      ),
    );
  }
}
