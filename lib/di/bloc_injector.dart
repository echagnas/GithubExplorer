import 'package:github_dashboard/di/bloc_module.dart';
import 'package:inject/inject.dart';

import '../main.dart';

@Injector(const [BlocModule])
abstract class BlocInjector {
  MyApp get app;

  static final create = g.BlocInjector$Injector.create;
}
