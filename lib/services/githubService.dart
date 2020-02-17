import 'package:github_dashboard/configs/strings.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getProfileFromGitHub(String user) {
  String url = "$strGitHubUrl/$strGitHubUser/$user";
  print("Url: $url");
  return http.get(url);
}
