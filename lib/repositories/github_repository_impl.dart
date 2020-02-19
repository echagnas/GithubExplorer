import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:github_dashboard/services/github_services.dart';
import 'package:github_dashboard/utils/error.dart';
import 'package:github_dashboard/utils/result.dart';

///
/// Implementation of the repository.
///
class GitHubRepositoryImpl implements GitHubRepository {
  @override
  Future<Result<ErrorService, Profile>> getProfile(String user) async {
    try {
      var response = await getProfileFromGitHub(user);
      print("Status code = ${response.statusCode}");
      print("Body = ${response.body}");

      switch (response.statusCode) {
        case 200:
          return Ok(Profile.fromJson(json.decode(response.body)));
        case 403:
          return Error(ErrorService(ErrorServiceType.RateLimit, "Too many requests, please wait and try again later"));
        case 404:
          return Error(ErrorService(ErrorServiceType.NotFound, "Can't find a user called '$user'"));
      }
      return Error(
          ErrorService(ErrorServiceType.Server, "Something wrong with the server ? (code=${response.statusCode})"));
    } on BadKeyException catch (error) {
      return Error(ErrorService(ErrorServiceType.JsonDecode, error.message));
    } catch (error) {
      return Error(ErrorService(ErrorServiceType.Fatal, error.toString()));
    }
  }

  @override
  Future<Result<ErrorService, List<Repository>>> getRepositories(String user) async {
    try {
      var response = await getRepositoriesFromGitHub(user);
      print("Status code = ${response.statusCode}");
      print("Body = ${response.body}");

      switch (response.statusCode) {
        case 200:
          List<Repository> list = (json.decode(response.body) as List).map((i) => Repository.fromJson(i)).toList();
          return Ok(list);
        case 403:
          return Error(ErrorService(ErrorServiceType.RateLimit, "Too many requests, please wait and try again later"));
        case 404:
          return Error(
              ErrorService(ErrorServiceType.NotFound, "Can't find the repositories of the user called '$user'"));
      }

      return Error(ErrorService(ErrorServiceType.Server, "Something wrong with the server ?"));
    } on BadKeyException catch (error) {
      return Error(ErrorService(ErrorServiceType.JsonDecode, error.message));
    } catch (error) {
      return Error(ErrorService(ErrorServiceType.Fatal, error.toString()));
    }
  }
}
