import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
class calendScreen extends StatefulWidget {
  final DateTime dateTime;
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
    return Scaffold(
      appBar: AppBar(title: Text('protected Calender')),
      body: content(),
    );
  }
  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Selected Day = ${formattedDateToString(today)}'),
          TableCalendar(
            locale: 'ja_JP',
            rowHeight: 43,
            headerStyle: const HeaderStyle(formatButtonVisible: false,titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day,today),
            focusedDay: today,
            firstDay: DateTime.utc(2023,8,22),
            lastDay: DateTime.utc(2099,3,14),
            onDaySelected: _onDaySelection,
          ),
        ],
      ),
    );
  }
}
