import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/viewmodels/search_viewmodel.dart';
import 'package:github_dashboard/pages/repository_detail_page.dart';
import 'package:provider/provider.dart';

class RepositoryListWidget extends StatelessWidget {
  final String avatarUrl;
  final String userName;

  const RepositoryListWidget({@required this.avatarUrl, @required this.userName});

  @override
  Widget build(BuildContext context) {
    var repositories = Provider.of<SearchViewModel>(context).getRepositories();

    return ListView.separated(
      itemCount: repositories.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Icon(Icons.arrow_forward),
          title: Text(repositories[index].name),
          leading: Icon(Icons.store_mall_directory),
          onTap: () {
            onTapTile(context, repositories[index]);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 0.5,
        color: primaryColor,
      ),
    );
  }

  ///
  /// Click on a repository
  ///
  void onTapTile(BuildContext context, Repository repository) {
    Navigator.of(context).pushNamed(
      RepositoryDetailPage.id,
      arguments: _createDetailArguments(context, repository),
    );
  }

  ///
  /// Create argument for the  detail page
  ///
  RepositoryDetailPageArgument _createDetailArguments(BuildContext context, Repository repository) {
    return RepositoryDetailPageArgument(
      name: repository.name,
      avatar_url: avatarUrl,
      description: repository.description,
      html_url: repository.html_url,
      language: repository.language,
      stargazersCount: repository.stargazers_count,
      userName: userName,
    );
  }
}
