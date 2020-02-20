import 'package:github_dashboard/repositories/github_repository_mock_impl.dart';
import 'package:test/test.dart';

class Type<T> {
  T value;
  Type(T value) {
    this.value = value;
  }
}

Future<Type<String>> getResult() {
  Type<String> typeStr = Type<String>("OK");
  return Future.value(typeStr);
}

void main() {
  group("Test:", () {
    test('Future parameterized', () {
      var result = getResult();
      result.then((value) {
        expect(
          value.value,
          "OK",
          reason: "Value must be 'OK'",
        );
      });
    });

    test('GitHubRepository', () {
      var repository = GitHubRepositoryMockImpl();
      expect(repository != null, true, reason: "repository is null");

      var futureResult = repository.getProfile("echagnas");
      futureResult.then(
        (value) {
          value.join(
              ok: (result) {
                expect(result.name, "Emmanuel Chagnas", reason: "Name must be 'Emmanuel Chagnas'");
                expect(result.avatar_url, "https://avatars1.githubusercontent.com/u/6551951?v=4",
                    reason: "Avatar url must be 'https://avatars1.githubusercontent.com/u/6551951?v=4'");
                expect(result.login, "echagnas", reason: "Login must be 'echagnas'");
                expect(result.repos_url, "https://api.github.com/users/echagnas/repos",
                    reason: "Repo url must be 'https://api.github.com/users/echagnas/repos'");
                expect(result.id, 6551951, reason: "Id must be '6551951'");
              },
              error: (error) => print("Error=${error.message}"));
        },
      );
    });
  });
}
