import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:github_dashboard/repositories/github_repository_impl.dart';
import 'package:github_dashboard/repositories/github_repository_mock_impl.dart';

enum FLAVOR { MOCK, DEV }

class CONFIGURATION {
  static FLAVOR _currentFlavor = FLAVOR.DEV;

  //For the moment, waiting to find a good solution for dependencies injection
  static GitHubRepository gitHubRepositoryBuilder() {
    switch (_currentFlavor) {
      case FLAVOR.DEV:
        return GitHubRepositoryImpl();
        break;
      case FLAVOR.MOCK:
        return GitHubRepositoryMockImpl();
        break;
    }
  }

  static void setFlavors(FLAVOR flavor) {
    _currentFlavor = flavor;
  }
}
