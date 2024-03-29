import 'package:flutter/material.dart';
import 'package:sorting_algo_visualizer/home.dart';
import 'package:sorting_algo_visualizer/testalgo.dart';
import 'package:sorting_algo_visualizer/testchart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
