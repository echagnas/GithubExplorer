import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/values.dart';
import 'package:github_dashboard/configs/strings.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/utils/error.dart';
import 'package:github_dashboard/viewmodels/search_viewmodel.dart';
import 'package:github_dashboard/widgets/profile_card_widget.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String login;
  TextEditingController textEditingController = TextEditingController();
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(_editingFinished);
    _focusNode = FocusNode();
  }

  void _editingFinished() {
    login = textEditingController.text;
  }

  @override
  void dispose() {
    textEditingController.removeListener(_editingFinished);
    textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: STR.searchHint,
                    border: OutlineInputBorder(),
                  ),
                  controller: textEditingController,
                  onSubmitted: (value) {
                    print("ON SUBMITTED");
                    searchProfile(context, value);
                  },
                ),
              ),
              SizedBox(
                width: VALUES.littleMargin,
              ),
              MaterialButton(
                focusNode: _focusNode,
                color: primaryColor,
                onPressed: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                  searchProfile(context, login);
                },
                child: Text(STR.searchUser),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: showAvatar(context),
          )
        ],
      ),
    );
  }
}

///
/// Start to retrieve profile data
///
void searchProfile(BuildContext context, String login) {
  Provider.of<SearchViewModel>(context, listen: false).searchProfile(login);
}

///
/// Get avatar URL picturer from ViewModel.
/// If no URL, show a empty Container.
///
Widget showAvatar(BuildContext context) {
  Widget widget = Container();
  var viewModelStatus = Provider.of<SearchViewModel>(context).value;
  viewModelStatus.join(
    loading: () {
      print("STATUS loading...");
      //TODO show loader
    },
    empty: () {
      print("STATUS empty");
    },
    issue: (ErrorService error) {
      //TODO show error
      print("STATUS issue");
    },
    loaded: (value) {
      print("STATUS loaded");
      widget = ProfileCardWidget(value);
    },
  );
  return widget;
}
