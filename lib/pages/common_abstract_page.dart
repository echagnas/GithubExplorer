import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/values.dart';
import 'package:github_dashboard/configs/themes.dart';

import '../configs/strings.dart';

///
/// Common page. Encapsulate boiler plate like Scaffold.
/// All pages  of the application must have it as child to have the same look.
///
class CommonAbstractPage extends StatelessWidget {
  final Widget child;
  final String appBarTitle;

  CommonAbstractPage({this.child, this.appBarTitle = STR.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Container(
          padding: EdgeInsets.all(VALUES.mediumMargin),
          constraints: BoxConstraints.expand(),
          color: backgroundColor,
          child: this.child,
        ),
      ),
    );
  }
}
