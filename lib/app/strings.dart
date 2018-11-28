import 'package:flutter/material.dart';
import 'package:flutter_times/model/preference_model.dart';

class AppStrings extends InheritedWidget {
  final AppLocale locale;
  final Widget child;

  static AppStrings of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(AppStrings);

  AppStrings({
    Key key,
    @required this.locale,
    @required this.child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppStrings oldWidget) => locale != oldWidget.locale;

  String _fix(String value) => value;

  String _translated({
    @required String en,
    @required String hu,
  }) {
    String value;
    switch (locale) {
      case AppLocale.english:
        value = en;
        break;
      case AppLocale.hungarian:
        value = hu;
        break;
    }
    return value ?? en;
  }

  String get appName => _fix('Flutter Times');
}
