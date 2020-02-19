import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/configs/values.dart';

class CardWidget extends StatelessWidget {
  final Widget child;

  const CardWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundCard,
      elevation: VALUES.cardElevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: VALUES.cardBorderSize,
          color: borderCardColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(VALUES.cardBorderRadius)),
      ),
      child: child,
    );
  }
}
