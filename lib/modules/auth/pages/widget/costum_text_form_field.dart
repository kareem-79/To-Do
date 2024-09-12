import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String hint;
  String label;
  var icon;
  var controller;
  var validator;

  CustomText({super.key, required this.hint, required this.label,required this.icon,required this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: icon,
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.blue))),
    );
  }
}
