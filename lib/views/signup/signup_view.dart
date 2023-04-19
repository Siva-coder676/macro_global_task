import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/theme/colors.dart';
import 'package:macro_global_task/views/login/widgets/task_product_field_widgets.dart';
import 'package:macro_global_task/widgets/task_button.dart';
import 'package:macro_global_task/widgets/task_text.dart';
import 'package:stacked/stacked.dart';
import 'signup_view_model.dart';

class SignupView extends StatefulWidget {
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      builder: (BuildContext context, SignupViewModel viewModel, Widget? _) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new ExactAssetImage('assets/login_logo.png'),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    TaskText(
                      text: "signup".toUpperCase(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskProductFieldWidgets(
                    hintText: "Name",
                    textEditingController: viewModel.nameController,
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskProductFieldWidgets(
                    hintText: "Phone Number",
                    textEditingController: viewModel.numberController,
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskProductFieldWidgets(
                    hintText: "Email",
                    textEditingController: viewModel.emailController,
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskProductFieldWidgets(
                    hintText: "Password",
                    textEditingController: viewModel.passController,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                viewModel.imageFile != null
                    ? Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Image.file(
                            viewModel.imageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Logger().i("upload is tapped");
                                    viewModel.getFromGallery();
                                  },
                                  icon: Icon(
                                    Icons.upload,
                                    color: textColor,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  viewModel.getFromGallery();
                                },
                                child: Text("Upload an Image",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: textColor)),
                              )
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: TaskButton(
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: MediaQuery.of(context).size.height * 0.08,
                    buttonText: "signup".toUpperCase(),
                    voidCallback: () {
                      Logger().v("signup is tapped");
                      viewModel.validation();
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
      },
      viewModelBuilder: () => SignupViewModel(),
    );
  }
}
