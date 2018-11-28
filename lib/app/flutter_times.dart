import 'package:flutter/material.dart';
import 'package:flutter_times/ui/home_screen.dart';

class FlutterTimesApp extends StatefulWidget {
  @override
  _FlutterTimesAppState createState() => _FlutterTimesAppState();
}

class _FlutterTimesAppState extends State<FlutterTimesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
