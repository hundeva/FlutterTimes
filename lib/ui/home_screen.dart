import 'package:flutter/material.dart';
import 'package:flutter_times/app/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.of(context).appName),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
