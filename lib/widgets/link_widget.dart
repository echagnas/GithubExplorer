import 'package:flutter/material.dart';
import 'package:link/link.dart';

///
/// Widget with a link url
///
class LinkWidget extends StatelessWidget {
  const LinkWidget({
    Key key,
    @required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Link(
      child: Text(
        url,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
      url: url,
    );
  }
}
