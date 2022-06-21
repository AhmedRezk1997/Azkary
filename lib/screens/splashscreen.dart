import 'dart:async';
//import 'dart:html';

import 'package:azkary/screens/azkarhome.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Azkarhome())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[100],
        body: Stack(children: [
          Center(
            child: Text(
              "اذكار المسلم",
              style: TextStyle(fontSize: 40, color: Colors.cyan[600]),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset("images/app.png")),
        ]),
      ),
    );
  }
}
