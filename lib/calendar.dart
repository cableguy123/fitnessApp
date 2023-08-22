import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class calendScreen extends StatefulWidget {
  const calendScreen({Key? key}) : super(key: key);
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
          Text('Selected Day = ${today.toString().split(" ")[0]}'),
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
