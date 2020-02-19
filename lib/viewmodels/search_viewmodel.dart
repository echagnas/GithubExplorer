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
  void searchProfile(String login) async {
    value = Loading();
    notifyListeners();

    (await repository.getProfile(login)).join(
      ok: (profile) {
        value = Loaded(profile);
        notifyListeners();

        //retrieve repositories
        _getRepositories(login);
      },
      error: (error) {
        value = Issue(error);
      },
    );
  }

  void reset() {
    value = Empty();
    notifyListeners();
  }

  ///
  /// Retrieve repositories.
  /// Called just after the result of the profile in background.
  ///
  void _getRepositories(String login) async {
    (await repository.getRepositories(login)).join(
      ok: (repositories) {
        _repositories = repositories;
        notifyListeners();
      },
      error: (error) {
        print("Error: $error");
        //if error on repositories, don't show error.
      },
    );
  }

  ///
  /// Return the list of the repositories.
  ///
  List<Repository> getRepositories() {
    return _repositories ?? List<Repository>();
  }
}
