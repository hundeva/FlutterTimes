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

  String get theme => _translated(
        en: 'Theme',
        hu: 'Téma',
      );

  String get light => _translated(
        en: 'Light',
        hu: 'Világos',
      );

  String get dark => _translated(
        en: 'Dark',
        hu: 'Sötét',
      );

  String get black => _translated(
        en: 'Black',
        hu: 'Fekete',
      );

  String get language => _translated(
        en: 'Language',
        hu: 'Nyelv',
      );

  String get english => _translated(
        en: 'English',
        hu: 'Angol',
      );

  String get hungarian => _translated(
        en: 'Hungarian',
        hu: 'Magyar',
      );

  String get style => _translated(
        en: 'Style',
        hu: 'Stílus',
      );

  String get compact => _translated(
        en: 'Compact',
        hu: 'Kompakt',
      );

  String get list => _translated(
        en: 'List',
        hu: 'Lista',
      );

  String get card => _translated(
        en: 'Card',
        hu: 'Kártya',
      );
}
