import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/values.dart';
import 'package:github_dashboard/widgets/avatar_widget.dart';

import 'common_abstract_page.dart';

///
/// Page used to show details of a repository.
///
class RepositoryDetailPage extends StatelessWidget {
  static final String id = "/detail";

  @override
  Widget build(BuildContext context) {
    final RepositoryDetailPageArgument arguments = ModalRoute.of(context).settings.arguments;

    //TODO test if the arguments exist else show error.

    return CommonAbstractPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              AvatarWidget(
                width: VALUES.littleAvatarPictureWidth,
                height: VALUES.littleAvatarPictureHeight,
                imageUrl: arguments.avatar_url,
              ),
              SizedBox(
                width: VALUES.mediumMargin,
              ),
              Text(arguments.userName.toString()),
            ],
          ),
          SizedBox(
            height: VALUES.mediumMargin,
          ),
          //TODO introduce the card extracts from ProfileCardWidget
          Text("Language: ${arguments.language}"),
          Text("Stars: ${arguments.stargazersCount}"),
          Text("Description: ${arguments.description}"),
          Text("URL: ${arguments.html_url}"),
        ],
      ),
      appBarTitle: arguments.name,
    );
  }
}

///
/// Arguments to pass to the page.
///
class RepositoryDetailPageArgument {
  String name;
  String language;
  int stargazersCount;
  String description;
  String html_url;
  String avatar_url;
  String userName;

  RepositoryDetailPageArgument({
    @required this.name,
    @required this.language,
    @required this.stargazersCount,
    @required this.description,
    @required this.html_url,
    @required this.avatar_url,
    @required this.userName,
  });
}
