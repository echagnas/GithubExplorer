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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RepositoryDetailPage.id:
            return getPageRouteBuilder(RepositoryDetailPage(), settings);
          case SearchPage.id:
            return getPageRouteBuilder(SearchPage(), settings);
        }
        // unknown route
        return MaterialPageRoute(builder: (context) => SearchPage());
      },
    );
  }
}

PageRouteBuilder getPageRouteBuilder(Widget page, RouteSettings settings) {
  return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(opacity: anim, child: child);
      },
      settings: settings);
}
