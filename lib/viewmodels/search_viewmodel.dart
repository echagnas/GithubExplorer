import 'package:flutter/cupertino.dart';
import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/models/repository.dart';
import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:github_dashboard/utils/viewmodel_status.dart';

///
/// ViewModel for the Search page.
///
class SearchViewModel extends ValueNotifier<ViewModelStatus<Profile>> {
  GitHubRepository repository;

  //Initialisation with "Empty" status.
  SearchViewModel({this.repository}) : super(Empty());

  List<Repository> _repositories;

  ///
  /// Retrieve profile.
  ///
  void searchProfile(String login) {
    value = Loading();
    notifyListeners();
    repository.getProfile(login).then((resultProfile) {
      value = Loaded(resultProfile);
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
}
