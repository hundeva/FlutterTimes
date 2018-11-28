import 'package:flutter/material.dart';
import 'package:flutter_times/model/preference_model.dart';

class AppStyles extends InheritedWidget {
  final AppStyle style;
  final Widget child;

  static AppStyles of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(AppStyles);

  AppStyles({
    Key key,
    @required this.style,
    @required this.child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppStyles oldWidget) => style != oldWidget.style;
}
