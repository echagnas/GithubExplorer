import 'package:flutter/cupertino.dart';
import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/repositories/github_repository.dart';

///
/// ViewModel for the Search page.
///
class SearchViewModel extends ChangeNotifier {
  GitHubRepository repository;

  SearchViewModel({this.repository});

  Profile profile;
  List<Repository> _repositories;

  ///
  /// Retrieve profile.
  ///
  void searchProfile(String login) {
    repository.getProfile(login).then((resultProfile) {
      profile = resultProfile;
      _getRepositories(login);
      notifyListeners();
    });
  }

  ///
  /// Retrieve repositories.
  /// Called just after the result of the profile in background.
  ///
  void _getRepositories(String login) {
    repository.getRepositories(login).then((resultRepositories) {
      _repositories = resultRepositories;
      notifyListeners();
    });
  }

  ///
  /// Return the list of the repositories.
  ///
  List<Repository> getRepositories() {
    return _repositories ?? List<Repository>();
  }

  ///
  /// Return the name of the user's repository.
  ///
  String getName() {
    return profile?.name ?? "";
  }

  ///
  /// Return the url of the user's photo.
  ///
  String getAvatarUrl() {
    return profile?.avatar_url ?? "";
  }
}
