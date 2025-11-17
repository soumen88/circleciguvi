import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisplayErrorWidget extends StatelessWidget {

  final String errorMessage;


  DisplayErrorWidget({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "assets/images/something_went_wrong.webp",
                width: 200,
                height: 300,
            ),
            Text("Error - $errorMessage")
          ],
        ),
      ),
    );
  }
}
