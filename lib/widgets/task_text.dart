import 'package:flutter/material.dart';
import 'package:macro_global_task/theme/colors.dart';

class TaskText extends StatelessWidget {
  final String? text;
  final Color? color;

  TaskText({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: color != null ? color : textColor,
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
  }
}
