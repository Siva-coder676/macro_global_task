import 'package:flutter/material.dart';
import 'package:macro_global_task/theme/colors.dart';

class TaskProductFieldWidgets extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  TaskProductFieldWidgets(
      {this.hintText, this.textEditingController, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText!,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: textColor, width: 2), //border Color
        ),
      ),
    );
  }
}
