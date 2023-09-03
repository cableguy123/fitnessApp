import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class calendScreen extends StatefulWidget {
  DateTime dateTime = DateTime.now();
  calendScreen({required this.dateTime});
  @override
  State<calendScreen> createState() => _calendScreenState();
}

class _calendScreenState extends State<calendScreen> {
  DateTime today = DateTime.now();
  void _onDaySelection(DateTime day,DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
  // before Day
  DateTime getPreviousDate(DateTime date) {
    return date.subtract(Duration(days: 1));
  }
  // Next Day
  DateTime getNextDate(DateTime date) {
    return date.add(Duration(days: 1));
  }
  String formattedDateToString(DateTime date) {
    return DateFormat('yy-MM-dd').format(date);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: content(),
    );
  }
  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Container(
            child: TableCalendar(
              locale: 'ja_JP',
              rowHeight: 70,
              headerStyle: const HeaderStyle(formatButtonVisible: false,titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day,today),
              focusedDay: today,
              firstDay: DateTime.utc(2023,8,22),
              lastDay: DateTime.utc(2099,3,14),
              onDaySelected: _onDaySelection,
            ),
        ),
      ),
    );
  }
}
