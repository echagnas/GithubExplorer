import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/strings.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/pages/repository_detail_page.dart';
import 'package:github_dashboard/pages/search_page.dart';
import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:inject/inject.dart';

import 'di/bloc_injector.dart';
import 'di/bloc_module.dart';

void main() async {
  var container = await BlocInjector.create(BlocModule());
  runApp(container.app);
}

class MyApp extends StatelessWidget {
  final GitHubRepository repository;

  @provide
  MyApp(this.repository);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: STR.title,
      theme: appTheme,
      initialRoute: SearchPage.id,
      routes: {
        SearchPage.id: (_) => SearchPage(repository),
        RepositoryDetailPage.id: (_) => RepositoryDetailPage(),
      },
    );
  }
}
