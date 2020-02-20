import 'package:github_dashboard/repositories/github_repository.dart';
import 'package:github_dashboard/repositories/github_repository_mock_impl.dart';
import 'package:inject/inject.dart';

///
/// INJECTION MODULE FROM GOOGLE : https://github.com/google/inject.dart
///
/// See example here: https://blog.usejournal.com/compile-time-dependency-injection-in-flutter-95bb190b4a71
///
/// @module: This annotation will make BlocModule class available to contribute to the dependency
/// graph that inject.dart will generate. It will hold all the dependencies required by other classes.
///
/// @provide: All the methods annotated with this are available for dependency injection. Checking
/// the code above will make things clear.
///
/// @singleton: As the name suggests, it will create and provide a single instance of the object.
///

@module
class BlocModule {
  @provide
  GitHubRepository repository() => GitHubRepositoryMockImpl();
}
