import 'package:circleciguvi/list_demo/page_one.dart';
import 'package:circleciguvi/list_demo/page_three.dart';
import 'package:circleciguvi/list_demo/page_two.dart';
import 'package:flutter/material.dart';

class PageViewDemonstration extends StatelessWidget {
  const PageViewDemonstration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          children: [
            PageOne(),
            PageTwo(),
            PageThree()
          ],
        ),
      ),
    );
  }
}
