import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UiHelper {
  static CustomTextField(
      {required TextEditingController controller,
      required String text,
      required IconData iconData}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          )),
    );
  }
}
