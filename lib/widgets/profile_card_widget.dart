import 'package:flutter/material.dart';
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
      //TODO extract the card widget (for Detail page)
      child: Card(
        color: backgroundCard,
        elevation: VALUES.cardElevation,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: VALUES.cardBorderSize,
            color: borderCardColor,
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(VALUES.cardBorderRadius)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(VALUES.mediumMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  //TODO Extract the Avatar widget
                  Hero(
                    tag: "avatar",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        Provider.of<SearchViewModel>(context).getAvatarUrl(),
                        width: VALUES.avatarPictureWidth,
                        height: VALUES.avatarPictureHeight,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: VALUES.littleMargin,
                  ),
                  Expanded(
                    child: Center(
                      child:
                          Text(Provider.of<SearchViewModel>(context).getName()),
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
