import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Dropdown extends StatefulWidget {
  final String title;

  Dropdown(this.title);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.blue[700],
      margin: EdgeInsets.all(12),
      child: ExpansionTile(
        iconColor: Colors.white,
        backgroundColor: Colors.blue[700],
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        children: <Widget>[
          Container(
            child: TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2009, 01, 01),
              lastDay: DateTime.utc(2040, 1, 01),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
