import 'package:flutter/material.dart';
import 'package:macro_global_task/core/router_constants.dart';
import 'package:stacked_services/stacked_services.dart';
import 'core/router.dart' as router;
import 'package:firebase_core/firebase_core.dart';
import 'core/services/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocatorInjector.setUpLocator();
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: splashScreenViewRoute,
    );
  }
}
