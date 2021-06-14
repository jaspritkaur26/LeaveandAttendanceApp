import 'package:attendance/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import '../widgets/dropdown.dart';
import '/widgets/holiday_dropdown.dart';
import '../widgets/leave_dropdown.dart';
import '../widgets/drawer_app.dart';
import '../widgets/product.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave & Attendance'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dehaze), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: ''),
        ],
      ),
      drawer: DrawerApp(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Product("1", "Absent Days For Current & Last Month", Colors.red,
                    Icons.holiday_village_outlined),
                Product("2", "Leave & Regularization history",
                    Colors.blue.shade700, Icons.alarm),
                Product("3", "Time report \n - Team", Colors.blue.shade700,
                    Icons.group),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Dropdown('My Calender'),
            Leave('Apply Leave'),
            Holiday('Holiday Calender'),
          ],
        )),
      ),
    );
  }
}
