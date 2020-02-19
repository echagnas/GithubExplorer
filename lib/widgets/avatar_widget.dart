import 'package:flutter/material.dart';

const String TAG = "avatar";

///
/// Avatar widget with  photo.
///
class AvatarWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const AvatarWidget({Key key, @required this.width, @required this.height, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: TAG,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Image.network(
          imageUrl,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
