import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_times/app/strings.dart';
import 'package:flutter_times/bloc/preference_bloc.dart';
import 'package:flutter_times/model/preference_model.dart';
import 'package:flutter_times/widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      drawer: _drawer(context),
      body: _body(context),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.of(context).appName),
    );
  }

  Widget _drawer(BuildContext context) {
    PreferenceBloc bloc = BlocProvider.of(context);
    return BlocBuilder<PreferenceEvent, PreferenceState>(
        bloc: bloc,
        builder: (BuildContext context, PreferenceState state) {
          return Drawer(
            child: ListView(
              children: <Widget>[
                Caption(text: AppStrings.of(context).theme),
                RadioListTile(
                  title: Text(AppStrings.of(context).light),
                  value: AppTheme.light,
                  groupValue: 'theme',
                  onChanged: (value) => bloc.dispatch(ThemeChanged(value)),
                  selected: state.theme == AppTheme.light,
                ),
                RadioListTile(
                  title: Text(AppStrings.of(context).dark),
                  value: AppTheme.dark,
                  groupValue: 'theme',
                  onChanged: (value) => bloc.dispatch(ThemeChanged(value)),
                  selected: state.theme == AppTheme.dark,
                ),
                RadioListTile(
                  title: Text(AppStrings.of(context).black),
                  value: AppTheme.black,
                  groupValue: 'theme',
                  onChanged: (value) => bloc.dispatch(ThemeChanged(value)),
                  selected: state.theme == AppTheme.black,
                ),
                Caption(text: AppStrings.of(context).language),
                RadioListTile(
                  title: Text(AppStrings.of(context).english),
                  value: AppLocale.english,
                  groupValue: 'locale',
                  onChanged: (value) => bloc.dispatch(LocaleChanged(value)),
                  selected: state.locale == AppLocale.english,
                ),
                RadioListTile(
                  title: Text(AppStrings.of(context).hungarian),
                  value: AppLocale.hungarian,
                  groupValue: 'locale',
                  onChanged: (value) => bloc.dispatch(LocaleChanged(value)),
                  selected: state.locale == AppLocale.hungarian,
                ),
                Caption(text: AppStrings.of(context).style),
                RadioListTile(
                  title: Text(AppStrings.of(context).compact),
                  value: AppStyle.compact,
                  groupValue: 'style',
                  onChanged: (value) => bloc.dispatch(StyleChanged(value)),
                  selected: state.style == AppStyle.compact,
                ),
                RadioListTile(
                  title: Text(AppStrings.of(context).list),
                  value: AppStyle.list,
                  groupValue: 'style',
                  onChanged: (value) => bloc.dispatch(StyleChanged(value)),
                  selected: state.style == AppStyle.list,
                ),
                RadioListTile(
                  title: Text(AppStrings.of(context).card),
                  value: AppStyle.card,
                  groupValue: 'style',
                  onChanged: (value) => bloc.dispatch(StyleChanged(value)),
                  selected: state.style == AppStyle.card,
                ),
              ],
            ),
          );
        });
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}
