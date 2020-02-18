import 'dart:convert';

import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:github_dashboard/services/github_services.dart';

///
/// Implementation of the repository.
///
class GitHubRepositoryImpl implements GitHubRepository {
  @override
  Future<Profile> getProfile(String user) async {
    var response = await getProfileFromGitHub(user);
    print("Status code = ${response.statusCode}");
    print("Body = ${response.body}");
    return Profile.fromJson(json.decode(response.body));
  }

  @override
  Future<List<Repository>> getRepositories(String user) async {
    var response = await getRepositoriesFromGitHub(user);
    print("Status code = ${response.statusCode}");
    print("Body = ${response.body}");
    List<Repository> list = (json.decode(response.body) as List)
        .map((i) => Repository.fromJson(i))
        .toList();
    return list;
  }
}
