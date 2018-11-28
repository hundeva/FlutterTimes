import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_times/app/colors.dart';
import 'package:flutter_times/app/strings.dart';
import 'package:flutter_times/app/styles.dart';
import 'package:flutter_times/bloc/preference_bloc.dart';
import 'package:flutter_times/ui/home_screen.dart';

class FlutterTimesApp extends StatefulWidget {
  @override
  _FlutterTimesAppState createState() => _FlutterTimesAppState();
}

class _FlutterTimesAppState extends State<FlutterTimesApp> {
  final PreferenceBloc _preferenceBloc = PreferenceBloc();

  @override
  Widget build(BuildContext context) => _bloc(context);

  Widget _bloc(BuildContext context) {
    return BlocProvider(
      bloc: _preferenceBloc,
      child: BlocBuilder<PreferenceEvent, PreferenceState>(
        bloc: _preferenceBloc,
        builder: (BuildContext context, PreferenceState state) => _home(state),
      ),
    );
  }

  Widget _home(PreferenceState state) {
    return AppColors(
      theme: state.theme,
      child: AppStrings(
        locale: state.locale,
        child: AppStyles(
          style: state.style,
          child: Builder(
            builder: (context) => _app(context),
          ),
        ),
      ),
    );
  }

  Widget _app(BuildContext context) {
    return MaterialApp(
      title: AppStrings.of(context).appName,
      theme: AppColors.of(context).themeData,
      home: HomeScreen(),
    );
  }
}
