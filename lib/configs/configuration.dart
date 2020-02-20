import 'package:get_it/get_it.dart';
import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:github_dashboard/repositories/github_repository_impl.dart';
import 'package:github_dashboard/repositories/github_repository_mock_impl.dart';

enum FLAVOR { MOCK, DEV, RELEASE }

GetIt di = GetIt.instance;

class CONFIGURATION {
  static FLAVOR _currentFlavor = FLAVOR.DEV;

  static init() {
    switch (_currentFlavor) {
      case FLAVOR.DEV:
        di.registerLazySingleton<GitHubRepository>(() => GitHubRepositoryImpl());
        break;
      case FLAVOR.MOCK:
        di.registerLazySingleton<GitHubRepository>(() => GitHubRepositoryMockImpl());
        break;
      case FLAVOR.RELEASE:
        di.registerLazySingleton<GitHubRepository>(() => GitHubRepositoryImpl());
        break;
    }
  }

  static void setFlavors(FLAVOR flavor) {
    _currentFlavor = flavor;
  }
}
