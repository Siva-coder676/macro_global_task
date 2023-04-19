import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/core/router_constants.dart';
import 'package:macro_global_task/core/services/local_service.dart';
import 'package:macro_global_task/core/services/locator.dart';
import 'package:macro_global_task/views/category_screen/category_screen_view.dart';
import 'package:macro_global_task/views/signup/signup_view.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService? navigationService = locator<NavigationService>();
  LocalService? localService = locator<LocalService>();

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  LoginViewModel() {}
  navigateToSignup() {
    navigationService!.navigateWithTransition(SignupView(), transition: "fade");
  }

  Future googleLogin() async {
    try {
      print("googleLogin method Called");

      GoogleSignIn _googleSignIn = GoogleSignIn();

      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      localService!.saveProfilePicture(reslut.photoUrl);
      navigateToCategoryScreen();

      notifyListeners();
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  navigateToCategoryScreen() {
    navigationService!.replaceWith(categoryScreenViewRoute);
  }
}
