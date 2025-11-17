import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {

  List<String> daysOfWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: daysOfWeek.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text("Hello $index"),
                trailing: Icon(Icons.access_alarm),
              );
            }
        ),
      ),
    );
  }
}
