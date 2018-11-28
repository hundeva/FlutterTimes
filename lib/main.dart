import 'package:flutter/material.dart';
import 'package:flutter_times/app/flutter_times.dart';
import 'package:flutter_times/store/database.dart';

void main() => setupDatabase().then(_handleStartup);

void _handleStartup(bool startup) {
  if (startup) {
    runApp(FlutterTimesApp());
  } else {
    throw StateError('Database could not be set up');
  }
}
