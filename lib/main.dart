import 'package:flutter/material.dart';
import 'package:github_dashboard/configs/strings.dart';
import 'package:github_dashboard/configs/themes.dart';
import 'package:github_dashboard/views/RepositoryDetail.dart';
import 'package:github_dashboard/views/RepositoryList.dart';
import 'package:github_dashboard/views/Search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: strTitle,
      theme: appTheme,
      initialRoute: Search.id,
      routes: {
        Search.id: (_) => Search(),
        RepositoryList.id: (_) => RepositoryList(),
        RepositoryDetail.id: (_) => RepositoryDetail(),
      },
    );
  }
}
