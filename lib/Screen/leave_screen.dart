import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class LeaveScreen extends StatefulWidget {
  @override
  var checked = false;
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late String fromDate;
  late String toDate;
  DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  get children => null;
  bool _checked = false;
  List<String> _locations = [
    'CL/Contingency Leave',
    'Optional Holiday',
    'Special Privilege Leave',
    'Work from home'
  ];

  String? type = "Select the Leave type";

  String? reason = "Select Reason";
  List<String> reasonList = [
    "Medical Issue",
    "Family Function",
    "Personal",
    "Others"
  ];
  var _selectedLocation;

  @override
  void initState() {
    super.initState();
    fromDate = DateFormat.yMd().format(DateTime.now());
    toDate = DateFormat.yMd().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    final DateFormat formatter = DateFormat('dd/MM/yyyy');

    void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateArgs) {
      print(dateArgs.value);
    }

    void _updateDates(dynamic value) {
      setState(() {
        fromDate = formatter.format(value.startDate);

        toDate = formatter.format(value.endDate);
      });
    }

    Widget TextFieldContainer(String title, String date) {
      return Container(
        height: maxHeight * 0.11,
        width: maxWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5),
              alignment: Alignment.bottomLeft,
              child: Text(
                date,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Leave & Attendance',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Apply leave',
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            padding: EdgeInsets.all(15),
            child: Text(
              'Apply Leave',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              onSelectionChanged: _onSelectionChanged,
              showActionButtons: true,
              controller: _dateRangePickerController,
              onSubmit: _updateDates,
              onCancel: () {
                _dateRangePickerController.selectedRange = null;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              TextFieldContainer("From Date*", fromDate),
              SizedBox(
                height: 15,
              ),
              TextFieldContainer("To Date*", toDate),
              SizedBox(
                height: 15,
              ),

              // leave

              Container(
                height: maxHeight * 0.13,
                width: maxWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Type of Leave*",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 15),
                      child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 30,
                          color: Colors.blue[700],
                        ),
                        hint: Text(
                          type.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            type = newValue.toString();
                          });
                        },
                        items: _locations.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              // CHECKBOX

              CheckboxListTile(
                title: Text('Apply for Half-Day',
                    style: TextStyle(fontSize: 20.0)),
                controlAffinity: ListTileControlAffinity.leading,
                value: _checked,
                onChanged: (bool? value) {
                  setState(() {
                    _checked = value!;
                  });
                },
              ),

              // REASON

              Container(
                height: maxHeight * 0.13,
                width: maxWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 19),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Reason",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 19),
                      child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 30,
                          color: Colors.blue[700],
                        ),
                        hint: Text(
                          reason.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            reason = newValue.toString();
                          });
                        },
                        items: reasonList.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //CONFIRM AND CANCEL BUTTONS

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancel",
                        style:
                            TextStyle(fontSize: 16.0, color: Colors.blue[700])),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.blue.shade700,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child:
                              Text("Confirm", style: TextStyle(fontSize: 16.0)),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              primary: Colors.grey,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 20))))
                ],
              )
            ]),
          ),
        ])));
  }
}
