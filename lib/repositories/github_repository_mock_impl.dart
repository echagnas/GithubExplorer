import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:github_dashboard/utils/error.dart';
import 'package:github_dashboard/utils/result.dart';

///
/// Mock implementation if the repository.
///
class GitHubRepositoryMockImpl extends GitHubRepository {
  @override
  Future<Result<ErrorService, Profile>> getProfile(String user) async {
    //FOR TESTING ERROR
    //await Future.delayed(Duration(seconds: 5));
    //return Error(ErrorService(ErrorServiceType.Server, "Something wrong with the server ? (code=${403})"));

    //FOR TESTING OK
    Profile profile = Profile("echagnas", "https://avatars1.githubusercontent.com/u/6551951?v=4", "Emmanuel Chagnas",
        "https://api.github.com/users/echagnas/repos", 6551951);
    return Ok(profile);
  }

  @override
  Future<Result<ErrorService, List<Repository>>> getRepositories(String user) async {
    List<Repository> repositories = new List<Repository>();
    repositories.add(Repository("Aventure", "Java", 0, "Jeux d'aventure", "http://google.fr"));
    return Ok(repositories);
  }
}
