import 'package:flutter_times/model/preference_model.dart';
import 'package:flutter_times/store/database.dart';

const String _theme = 'theme';
const String _locale = 'locale';
const String _style = 'style';

class PreferenceStore {
  const PreferenceStore();

  Future<AppTheme> getTheme() async {
    String json = await preferences.get(_theme);
    return AppTheme.values.firstWhere(
      (AppTheme theme) => theme.toString() == json,
      orElse: () => AppTheme.light,
    );
  }

  Future<AppTheme> setTheme(AppTheme theme) async {
    return preferences.put(theme.toString(), _theme);
  }

  Future<AppLocale> getLocale() async {
    String json = await preferences.get(_locale);
    return AppLocale.values.firstWhere(
      (AppLocale locale) => locale.toString() == json,
      orElse: () => AppLocale.english,
    );
  }

  Future<AppLocale> setLocale(AppLocale locale) async {
    return preferences.put(locale.toString(), _locale);
  }

  Future<AppStyle> getStyle() async {
    String json = await preferences.get(_style);
    return AppStyle.values.firstWhere(
      (AppStyle style) => style.toString() == json,
      orElse: () => AppStyle.list,
    );
  }

  Future<AppStyle> setStyle(AppStyle style) async {
    return preferences.put(style.toString(), _style);
  }
}
