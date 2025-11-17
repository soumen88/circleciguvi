import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisplayLoadingWidget extends StatelessWidget {
  const DisplayLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/animations/loading.json"),
      ),
    );
  }
}
