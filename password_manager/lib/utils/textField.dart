import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String label;
  TextEditingController? controller;
  FormFieldValidator<String> callBack;
  ValueChanged<String>? changed;
  MyTextField(
      {super.key,
      required this.label,
      required this.callBack,
      changed,
      controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
            filled: true,
            labelText: label),
        controller: controller,
        validator: callBack,
        onChanged: changed);
  }
}
