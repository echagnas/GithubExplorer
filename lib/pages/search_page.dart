import 'package:flutter/material.dart';
import 'package:github_dashboard/providers/search_viewmodel.dart';
import 'package:github_dashboard/pages/common_abstract_page.dart';
import 'package:github_dashboard/repositories/github_repository_impl.dart';
import 'package:github_dashboard/widgets/search_widget.dart';
import 'package:provider/provider.dart';

///
/// Page used to searching an user.
///
class SearchPage extends StatelessWidget {
  static final String id = "/search";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewModel>(
      create: (context) =>
          SearchViewModel(repository: GitHubRepositoryImpl()),
      child: CommonAbstractPage(
        child: SearchWidget(),
      ),
    );
  }
}
