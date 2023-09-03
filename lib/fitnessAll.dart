
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'mealdetails.dart';
import 'statistics.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'palette.dart';
import 'calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
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
  DateTime currentDate = DateTime.now(); // Today
  void updateDate(DateTime newDate) {
    setState(() {
      currentDate = newDate;
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeDateFormatting(Localizations.localeOf(context).languageCode);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
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
              child: Text('記録',style: TextStyle(color: indexNum == 0 ? enableColor : disableColor ),),
            ),
            title: Row(
              children: <Widget> [
                TextButton(onPressed: () {
                  setState(() {
                    indexNum = 1;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const statisticsScreen()));
                },
                    child: Text('統計',style: TextStyle(color: indexNum == 1 ? enableColor : disableColor),),
                ),
                const SizedBox(width: 5),
                TextButton(onPressed: () {
                  setState(() {
                    indexNum = 2;
                  });
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const mealScreen()));
                },
                    child: Text('今日の食事',style: TextStyle(color: indexNum == 2 ? enableColor : disableColor),)),
                ],
            ),
            bottom: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.lightBlue,
              unselectedLabelColor: Colors.black,
              tabs: <Widget> [
                Tab(
                    icon: Icon(Icons.keyboard_arrow_left),
                ),
                Tab(
                  icon: Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 5),
                      Text(DateFormat('MM-dd').format(currentDate),
                      style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                Tab (
                  icon: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
          body: TabBarView(
            // TabBarView -> 그 탭을 누를시,보여주는 화면인거임
            children: [
              leftArrowScreen(),
              calendScreen(dateTime: DateTime.now()),
              rightArrowsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
class leftArrowScreen extends StatefulWidget {
  const leftArrowScreen({super.key});

  @override
  State<leftArrowScreen> createState() => _leftArrowScreenState();
}

class _leftArrowScreenState extends State<leftArrowScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class rightArrowsScreen extends StatefulWidget {
  const rightArrowsScreen({super.key});

  @override
  State<rightArrowsScreen> createState() => _rightArrowsScreenState();
}

class _rightArrowsScreenState extends State<rightArrowsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
