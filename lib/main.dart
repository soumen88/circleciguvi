import 'package:circleciguvi/home/home_screen.dart';
import 'package:circleciguvi/onboarding/on_boarding_screen.dart';
import 'package:circleciguvi/productdisplay/api_demonstration_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomeScreen()
      //home: ApiDemonstrationScreen()
      home: OnBoardingScreen()
    );
  }

}