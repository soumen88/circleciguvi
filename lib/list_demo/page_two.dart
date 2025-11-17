import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {

  List<String> foodItems = [
    "Biryani",
    "Dosa",
    "Burger with Chicken toppings",
    "Paneer Tikkaa",
  ];

  @override
  Widget build(BuildContext contextReceived) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: ListTile.divideTiles(
            context: contextReceived,
            tiles: [
              ListTile(
                title: Text(foodItems[0]),
                leading: Icon(Icons.access_alarm_outlined),
              ),
              ListTile(
                title: Text(foodItems[1]),
                trailing: Icon(Icons.accessible_outlined),
              ),
              ListTile(
                title: Text(foodItems[2]),
              ),
            ]
        ).toList(),
      )
    );
  }
}
