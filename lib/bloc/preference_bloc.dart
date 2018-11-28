import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_times/app/flutter_times.dart';

class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  @override
  PreferenceState get initialState => PreferenceState.initial();

  @override
  Stream<PreferenceState> mapEventToState(
    PreferenceState state,
    PreferenceEvent event,
  ) async* {
    // TODO
    yield null;
  }
}

class PreferenceState {
  final AppTheme theme;
  final AppLocale locale;
  final AppStyle style;

  PreferenceState({
    @required this.theme,
    @required this.locale,
    @required this.style,
  });

  factory PreferenceState.initial() {
    return PreferenceState(
      theme: AppTheme.light,
      locale: AppLocale.english,
      style: AppStyle.list,
    );
  }

  PreferenceState copyWith({
    AppTheme theme,
    AppLocale locale,
    AppStyle style,
  }) {
    return PreferenceState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      style: style ?? this.style,
    );
  }
}

abstract class PreferenceEvent<T> {
  final T value;

  PreferenceEvent(this.value);
}

class LoadPreferences extends PreferenceEvent {
  LoadPreferences() : super(null);
}

class ThemeChanged extends PreferenceEvent<AppTheme> {
  ThemeChanged(AppTheme value) : super(value);
}

class LocaleChanged extends PreferenceEvent<AppLocale> {
  LocaleChanged(AppLocale value) : super(value);
}

class StyleChanged extends PreferenceEvent<AppStyle> {
  StyleChanged(AppStyle value) : super(value);
}
