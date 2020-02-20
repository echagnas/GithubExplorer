import 'package:github_dashboard/di/bloc_module.dart';
import 'package:inject/inject.dart';
import 'bloc_injector.inject.dart' as g;

import '../main.dart';

@Injector(const [BlocModule])
abstract class BlocInjector {
  @provide
  MyApp get app;

  static final create = g.BlocInjector$Injector.create;
}
