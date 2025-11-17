import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text("Inside Details Page"),
      ),
    );
  }
}
