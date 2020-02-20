import 'package:flutter/material.dart';
import 'package:github_dashboard/viewmodels/search_viewmodel.dart';
import 'package:github_dashboard/pages/common_abstract_page.dart';
import 'package:github_dashboard/widgets/search_widget.dart';
import 'package:provider/provider.dart';

///
/// Page used to searching an user.
///
class SearchPage extends StatelessWidget {
  static const String id = "/search";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewModel>(
      create: (context) => SearchViewModel(),
      child: CommonAbstractPage(
        child: SearchWidget(),
      ),
    );
  }
}
