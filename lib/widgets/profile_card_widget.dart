import 'package:flutter/material.dart';
import 'package:github_dashboard/widgets/card_widget.dart';
import 'package:github_dashboard/widgets/avatar_widget.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/configs/values.dart';
import 'package:github_dashboard/providers/search_viewmodel.dart';
import 'package:github_dashboard/widgets/repository_list_widget.dart';
import 'package:provider/provider.dart';

class ProfileCardWidget extends StatefulWidget {
  @override
  _ProfileCardWidgetState createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardWidget(
        child: Padding(
          padding: const EdgeInsets.all(VALUES.mediumMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AvatarWidget(
                    width: VALUES.avatarPictureWidth,
                    height: VALUES.avatarPictureHeight,
                    imageUrl: Provider.of<SearchViewModel>(context).getAvatarUrl(),
                  ),
                  SizedBox(
                    width: VALUES.littleMargin,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(Provider.of<SearchViewModel>(context).getName()),
                    ),
                  ),
                ],
              ),
              Divider(
                height: VALUES.mediumMargin,
                color: primaryColor,
                thickness: 2.0,
              ),
              Expanded(
                flex: 1,
                child: RepositoryListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
