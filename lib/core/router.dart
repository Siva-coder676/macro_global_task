// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:macro_global_task/core/router_constants.dart';

import 'package:macro_global_task/views/splash_screen/splash_screen_view.dart' as view0;
import 'package:macro_global_task/views/login/login_view.dart' as view1;
import 'package:macro_global_task/views/signup/signup_view.dart' as view2;
import 'package:macro_global_task/views/category_screen/category_screen_view.dart' as view3;
import 'package:macro_global_task/views/detail_screen/detail_screen_view.dart' as view4;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashScreenView());
      case loginViewRoute:
        return MaterialPageRoute(builder: (_) => view1.LoginView());
      case signupViewRoute:
        return MaterialPageRoute(builder: (_) => view2.SignupView());
      case categoryScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view3.CategoryScreenView());
      case detailScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view4.DetailScreenView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}