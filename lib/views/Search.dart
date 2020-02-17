import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/strings.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/providers/SearchViewModel.dart';
import 'package:github_dashboard/views/CommonContainer.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  static final String id = "/search";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewModel>(
      create: (context) => SearchViewModel(),
      child: CommonContainer(
        child: SearchContainer(),
      ),
    );
  }
}

class SearchContainer extends StatefulWidget {
  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  String login;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(_editingFinished);
  }

  void _editingFinished() {
    print("Editing finished");
    login = textEditingController.text;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: textEditingController,
          ),
          MaterialButton(
            color: primaryColor,
            onPressed: () => searchProfile(context, login),
            child: Text(strSearchUser),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text("Name: ${Provider.of<SearchViewModel>(context).getName()}"),
          Container(
            child: showAvatar(context),
          )
        ],
      ),
    );
  }
}

void searchProfile(BuildContext context, String login) {
  print("Calling WS...");
  Provider.of<SearchViewModel>(context, listen: false).searchProfile(login);
}

Widget showAvatar(BuildContext context) {
  var avatarUrl = Provider.of<SearchViewModel>(context).getAvatarUrl();
  if (avatarUrl.isNotEmpty) {
    return Image.network(avatarUrl);
  } else {
    return Container();
  }
}
