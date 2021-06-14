import 'package:attendance/Screen/leave_screen.dart';
import 'package:flutter/material.dart';

class Leave extends StatefulWidget {
  final String title;

  Leave(this.title);

  @override
  _LeaveState createState() => _LeaveState();
}

void SelectCategory(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    return LeaveScreen();
  }));
}

List<Widget> _buildExpansionTileChildren(BuildContext cont) => [
      Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          Card(
            child: ListTile(
                tileColor: Colors.white,
                isThreeLine: true,
                title: Text("CL/Contingency Leave",
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
                subtitle: Text("6.0 Remaining \nValid Till: 31/12/2021",
                    style: TextStyle(fontSize: 18.0)),
                trailing: FlatButton(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 10),
                  child: Text(
                    'APPLY',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue[700],
                    ),
                  ),
                  onPressed: () => SelectCategory(cont),
                )),
          ),
          Card(
            child: ListTile(
              tileColor: Colors.white,
              isThreeLine: true,
              title: Text("Optional Holiday",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
              subtitle: Text("3.0 Remaining\nValid Till:31/12/2021",
                  style: TextStyle(fontSize: 18.0)),
              trailing: FlatButton(
                padding: EdgeInsets.fromLTRB(60, 0, 0, 10),
                child: Text(
                  'APPLY',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue[700],
                  ),
                ),
                onPressed: () => SelectCategory(cont),
              ),
            ),
          ),
          Card(
            child: ListTile(
              tileColor: Colors.white,
              isThreeLine: true,
              title: Text("Special Privilege Leave",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
              subtitle: Text("10.0 Remaining\nValid Till:31/12/2021",
                  style: TextStyle(fontSize: 18.0)),
              trailing: FlatButton(
                padding: EdgeInsets.fromLTRB(60, 0, 0, 10),
                child: Text(
                  'APPLY',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue[700],
                  ),
                ),
                onPressed: () => SelectCategory(cont),
              ),
            ),
          ),
          Card(
              child: ListTile(
            title: Text(
              "See More",
              style: TextStyle(color: Colors.blue[700], fontSize: 18.0),
            ),
          ))
        ]),
      ),
    ];

class _LeaveState extends State<Leave> {
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
          children: _buildExpansionTileChildren(context),
        ));
  }
}
