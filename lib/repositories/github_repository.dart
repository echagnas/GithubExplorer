import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';

///
/// Interface of the repository.
///
abstract class GitHubRepository {
  Future<Profile> getProfile(String user);
  Future<List<Repository>> getRepositories(String user);
}
