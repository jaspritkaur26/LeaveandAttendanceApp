import 'package:flutter/material.dart';

class Holiday extends StatefulWidget {
  final String title;

  Holiday(this.title);

  @override
  _HolidayState createState() => _HolidayState();
}

List<Widget> _buildExpansionTileChildren() => [
      Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Card(
              child: ListTile(
                title: Text("15th August | Sun",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.green)),
                subtitle:
                    Text("Independence Day", style: TextStyle(fontSize: 18)),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("10th September | Fri",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.green)),
                subtitle:
                    Text("Ganesh Chaturthi", style: TextStyle(fontSize: 18)),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("2nd October | Sat",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.green)),
                subtitle:
                    Text("Gandhi Jayanti", style: TextStyle(fontSize: 18)),
              ),
            ),
            Card(
                child: ListTile(
              title: Text(
                "See All Holidays",
                style: TextStyle(color: Colors.blue[700], fontSize: 19.0),
              ),
            ))
          ]))
    ];

class _HolidayState extends State<Holiday> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue.shade700,
        margin: EdgeInsets.all(12),
        child: ExpansionTile(
          iconColor: Colors.white,
          backgroundColor: Colors.blue.shade700,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          children: _buildExpansionTileChildren(),
        ));
  }
}
