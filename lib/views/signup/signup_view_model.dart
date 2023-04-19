import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/core/services/locator.dart';
import 'package:macro_global_task/views/category_screen/category_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  SnackbarService? snackBarService = locator<SnackbarService>();
  NavigationService navigationService = locator<NavigationService>();

  SignupViewModel() {}
  File? imageFile;
  getFromGallery() async {
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  validation() {
    if (nameController.text.isEmpty) {
      snackBarService!.showSnackbar(message: "Enter Valid Name");
    }
    if (numberController.text.isEmpty || numberController.text.length != 10) {
      snackBarService!.showSnackbar(message: "Enter Valid Phone Number");
    }
    if (emailController.text.isEmpty || !emailController.text.contains("@")) {
      snackBarService!.showSnackbar(message: "Enter Valid Email");
    }
    if (passController.text.isEmpty) {
      snackBarService!.showSnackbar(message: "Enter Password");
    }
    if (imageFile == null) {
      snackBarService!.showSnackbar(message: "Please Upload Profile Pic");
    } else {
      navigateToCategoryScreen();
    }
  }

  navigateToCategoryScreen() {
    navigationService.navigateWithTransition(CategoryScreenView());
  }
}
