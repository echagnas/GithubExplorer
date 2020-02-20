import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/configuration.dart';
import 'package:github_dashboard/configs/strings.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/pages/repository_detail_page.dart';
import 'package:github_dashboard/pages/search_page.dart';

///
/// main.dart is used for RELEASE version.
///
void main() {
  CONFIGURATION.setFlavors(FLAVOR.RELEASE);
  CONFIGURATION.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: STR.title,
      theme: appTheme,
      initialRoute: SearchPage.id,
      routes: {
        SearchPage.id: (_) => SearchPage(),
        RepositoryDetailPage.id: (_) => RepositoryDetailPage(),
      },
    );
  }
}
