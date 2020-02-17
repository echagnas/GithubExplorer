import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/themes.dart';

import '../configs/strings.dart';

class CommonContainer extends StatelessWidget {
  final Widget child;

  CommonContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Scaffold(
        appBar: AppBar(
          title: Text(strTitle),
        ),
        body: Container(
          padding: EdgeInsets.all(5.0),
          constraints: BoxConstraints.expand(),
          color: backgroundColor,
          child: this.child,
        ),
      ),
    );
  }
}
