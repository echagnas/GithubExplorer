import 'dart:convert';

import 'package:github_dashboard/models/profile.dart';
import 'package:github_dashboard/services/githubService.dart';

class GetProfileRepository {
  Future<Profile> getProfile(String user) async {
    var response = await getProfileFromGitHub(user);
    print("Status code = ${response.statusCode}");
    print("Body = ${response.body}");
    return Profile.fromJson(json.decode(response.body));
  }
}
