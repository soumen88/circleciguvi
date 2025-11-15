import 'dart:async';

import 'package:circleciguvi/timer/timer_container.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TimerScreenState();
  }

}

class TimerScreenState extends State<TimerScreen>{

  int secondsPassed = 0;
  int displaySeconds = 0;
  int displayMins = 0;
  int displayHours = 0;
  Timer? _clockTimer;
  bool isTimerActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimerContainer(timerLabel: "Hours", timerValue: "$displayHours",),
                TimerContainer(timerLabel: "Mins",timerValue: "$displayMins",),
                TimerContainer(timerLabel: "Secs",timerValue: "$displaySeconds",),
              ],
            ),
            FilledButton(
                onPressed: (){
                  if(!isTimerActive){
                    isTimerActive = true;
                    _clockTimer = Timer.periodic(Duration(seconds: 1), (value){
                      calculateTime();
                    });
                  }


                },
                child: Text("Start Timer")
            ),
            ElevatedButton(
                onPressed: (){
                  _clockTimer?.cancel();
                  isTimerActive = false;
                },
                child: Text("Stop Timer")
            ),
            ElevatedButton(
                onPressed: (){
                  _clockTimer?.cancel();
                  isTimerActive = false;
                  Navigator.pop(context);
                },
                child: Text("Go back")
            ),
          ],
        )
      ),
    );
  }


  void calculateTime(){
    secondsPassed = secondsPassed + 1;
    displaySeconds = secondsPassed % 60;///Remainder
    displayMins = secondsPassed ~/ 60; ///Quotient
    displayHours = secondsPassed ~/ 3600;
    setState(() {

    });
  }
}