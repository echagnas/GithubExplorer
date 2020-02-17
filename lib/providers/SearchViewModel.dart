import 'package:flutter/cupertino.dart';
import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/repositories/GetProfileRepository.dart';

class SearchViewModel extends ChangeNotifier {
  final GetProfileRepository repository = GetProfileRepository();
  Profile profile;

  void searchProfile(String login) {
    //TODO remove mock data
    profile = Profile(
        "echagnas",
        "https://avatars1.githubusercontent.com/u/6551951?v=4",
        "Emmanuel Chagnas",
        "https://api.github.com/users/echagnas/repos",
        6551951);
    notifyListeners();

    //TODO pass login
    /*repository.getProfile("echagnas").then((value) {
      profile = value;
      notifyListeners();
    });*/
  }

  String getName() {
    return profile?.name ?? "";
  }

  String getAvatarUrl() {
    return profile?.avatar_url ?? "";
  }
}
