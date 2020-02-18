import 'package:github_dashboard/configs/strings.dart';
import 'package:http/http.dart' as http;

///
/// Retrieve profile
///
Future<http.Response> getProfileFromGitHub(String user) {
  String url = "${STR.gitHubUrl}/${STR.gitHubUser}/$user";
  print("Url: $url");
  return http.get(
    url,
    headers: {STR.username: STR.accesstoken},
  );
}

///
/// Retrieve repositories
///
Future<http.Response> getRepositoriesFromGitHub(String user) {
  String url = "${STR.gitHubUrl}/users/$user/${STR.gitHubRepo}";
  print("Url: $url");
  return http.get(
    url,
    headers: {STR.username: STR.accesstoken},
  );
}
