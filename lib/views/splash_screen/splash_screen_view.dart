import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:macro_global_task/theme/colors.dart';
import 'package:macro_global_task/views/category_screen/category_screen_view.dart';
import 'package:macro_global_task/views/login/login_view.dart';
import 'package:stacked/stacked.dart';
import 'splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder:
          (BuildContext context, SplashScreenViewModel viewModel, Widget? _) {
        return AnimatedSplashScreen(
          splash: Lottie.asset("assets/splash_logo.json"),
          nextScreen: LoginView(),
          backgroundColor: splashScreenBackgroundColor,
          duration: 4000,
          splashIconSize: 250,
          splashTransition: SplashTransition.sizeTransition,
          animationDuration: (Duration(seconds: 4)),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
