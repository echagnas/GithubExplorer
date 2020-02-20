import 'package:flutter/material.dart';
import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/widgets/card_widget.dart';
import 'package:github_dashboard/widgets/avatar_widget.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/configs/values.dart';
import 'package:github_dashboard/widgets/repository_list_widget.dart';

class ProfileCardWidget extends StatefulWidget {
  final Profile profile;

  ProfileCardWidget(this.profile);

  @override
  _ProfileCardWidgetState createState() => _ProfileCardWidgetState(profile);
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  final Profile profile;

  _ProfileCardWidgetState(this.profile);

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
                    imageUrl: profile.avatar_url,
                  ),
                  SizedBox(
                    width: VALUES.littleMargin,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(profile?.name ?? ""),
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
                child: RepositoryListWidget(
                  avatarUrl: profile.avatar_url,
                  userName: profile.name,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
