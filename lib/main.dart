import 'package:flutter/material.dart';
import 'package:veggie_stuffed_shells/demo.dart';
import 'package:veggie_stuffed_shells/home_screen.dart';
import 'package:veggie_stuffed_shells/pre.dart';
import 'package:veggie_stuffed_shells/second_screen.dart';
import 'package:veggie_stuffed_shells/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
