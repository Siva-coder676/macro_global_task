import 'package:flutter/material.dart';
import 'package:macro_global_task/theme/colors.dart';
import 'package:macro_global_task/widgets/task_text.dart';

class TaskButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? buttonText;
  final VoidCallback? voidCallback;
  const TaskButton(
      {this.width, this.height, this.buttonText, this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(
          buttonText!,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
        textColor: buttonTextColor,
        minWidth: width,
        height: height,
        color: splashScreenBackgroundColor,
        onPressed: () {
          voidCallback!();
        });
  }
}
