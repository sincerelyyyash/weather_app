import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:weatherapp_starter_project/screens/home_screen.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen(),
        title: "weather",
        debugShowCheckedModeBanner: false);
  }
}
