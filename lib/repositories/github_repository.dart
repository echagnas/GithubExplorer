import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/utils/error.dart';
import 'package:github_dashboard/utils/result.dart';

///
/// Interface of the repository.
///
abstract class GitHubRepository {
  Future<Result<ErrorService, Profile>> getProfile(String user);
  Future<Result<ErrorService, List<Repository>>> getRepositories(String user);
}
