import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/repositories/github_repository.dart';

///
/// Mock implementation if the repository.
///
class GitHubRepositoryMockImpl extends GitHubRepository {
  @override
  Future<Profile> getProfile(String user) {
    Profile profile = Profile(
        "echagnas",
        "https://avatars1.githubusercontent.com/u/6551951?v=4",
        "Emmanuel Chagnas",
        "https://api.github.com/users/echagnas/repos",
        6551951);
    return Future.value(profile);
  }

  @override
  Future<List<Repository>> getRepositories(String user) {
    List<Repository> repositories = new List<Repository>();
    repositories.add(Repository(
        "Aventure", "Java", 0, "Jeux d'aventure", "http://google.fr"));
    return Future.value(repositories);
  }
}
