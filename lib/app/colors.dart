import 'package:flutter/material.dart';
import 'package:flutter_times/model/preference_model.dart';

class AppColors extends InheritedWidget {
  final AppTheme theme;
  final Widget child;

  static AppColors of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(AppColors);

  AppColors({
    Key key,
    @required this.theme,
    @required this.child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppColors oldWidget) => theme != oldWidget.theme;

  Color _fix(int value) => Color(value);

  Color _themed({
    @required int light,
    @required int dark,
    int black,
  }) {
    int color;
    switch (theme) {
      case AppTheme.light:
        color = light;
        break;
      case AppTheme.dark:
        color = dark;
        break;
      case AppTheme.black:
        color = black ?? dark;
        break;
    }
    return Color(color ?? light);
  }

  ThemeData get themeData {
    return ThemeData(
      brightness: theme == AppTheme.light ? Brightness.light : Brightness.dark,
      primaryColor: primaryColor,
      accentColor: accentColor,
      scaffoldBackgroundColor: backgroundColor,
    );
  }

  Color get primaryColor => _themed(
        light: Colors.blueGrey.value,
        dark: Colors.blueGrey.shade800.value,
        black: Colors.blueGrey.shade900.value,
      );

  Color get accentColor => _themed(
        light: Colors.teal.shade500.value,
        dark: Colors.teal.shade700.value,
        black: Colors.teal.shade900.value,
      );

  Color get backgroundColor => _themed(
        light: 0xfffafafa,
        dark: 0xff303030,
        black: 0xff000000,
      );
}
