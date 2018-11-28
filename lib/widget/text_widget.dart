import 'package:flutter/material.dart';
import 'package:flutter_times/app/colors.dart';

const double _paddingMedium = 8.0;
const double _paddingLarge = 16.0;

class Caption extends StatelessWidget {
  final String text;

  const Caption({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _paddingLarge,
        vertical: _paddingMedium,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption.copyWith(
              color: AppColors.of(context).accentColor,
            ),
      ),
    );
  }
}
