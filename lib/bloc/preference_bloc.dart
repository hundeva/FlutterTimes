import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_times/model/preference_model.dart';
import 'package:flutter_times/store/preference_store.dart';

class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  final PreferenceStore _store = const PreferenceStore();

  @override
  PreferenceState get initialState => PreferenceState.initial();

  @override
  Stream<PreferenceState> mapEventToState(
    PreferenceState state,
    PreferenceEvent event,
  ) async* {
    PreferenceState newState;
    if (event is LoadPreferences) {
      newState = PreferenceState(
        theme: await _store.getTheme(),
        locale: await _store.getLocale(),
        style: await _store.getStyle(),
      );
    } else if (event is ThemeChanged) {
      newState = state.copyWith(theme: event.value);
      _store.setTheme(event.value);
    } else if (event is LocaleChanged) {
      newState = state.copyWith(locale: event.value);
      _store.setLocale(event.value);
    } else if (event is StyleChanged) {
      newState = state.copyWith(style: event.value);
      _store.setStyle(event.value);
    } else {
      throw UnimplementedError('$event is not implemented');
    }
    yield newState;
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
