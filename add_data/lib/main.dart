// ignore_for_file: prefer_const_constructors

import 'package:add_data/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Data pass",
      home: HomeScreen(),
    );
  }
}
