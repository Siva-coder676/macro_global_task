import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/core/router_constants.dart';
import 'package:macro_global_task/core/services/local_service.dart';
import 'package:macro_global_task/core/services/locator.dart';
import 'package:macro_global_task/theme/colors.dart';
import 'package:macro_global_task/widgets/task_text.dart';
import 'package:stacked_services/stacked_services.dart';

class TaskAppBar extends StatefulWidget {
  final String? text;
  TaskAppBar({this.text});

  @override
  State<TaskAppBar> createState() => _TaskAppBarState();
}

class _TaskAppBarState extends State<TaskAppBar> {
  String? profilePicUrl;
  LocalService? localService = locator<LocalService>();

  @override
  void initState() {
    getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: splashScreenBackgroundColor,
      title: TaskText(
        text: widget.text,
        color: buttonTextColor,
      ),
      actions: [
        IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.logout, color: buttonTextColor)),
        Padding(
            padding: EdgeInsets.only(right: 6),
            child: profilePicUrl == null
                ? SizedBox()
                : CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(profilePicUrl!),
                  ))
      ],
    );
  }

  Future<void> logout() async {
    NavigationService navigationService = locator<NavigationService>();
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    navigationService.replaceWith(loginViewRoute);
  }

  getProfileData() async {
    profilePicUrl = await localService!.getProfilePicture();
    Logger().w(profilePicUrl);
    setState(() {});
  }
}
