import 'package:flutter/material.dart';

class TimerContainer extends StatelessWidget{

  String timerLabel;
  String timerValue;


  TimerContainer({required this.timerLabel, required this.timerValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.green
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timerValue,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          Text(
            timerLabel,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

}