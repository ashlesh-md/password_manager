import 'package:flutter/material.dart';

class SiteTextField extends StatelessWidget {
  String label;
  FormFieldValidator<String> callBack;
  // ValueChanged<String>? changed;
  SiteTextField(
      {super.key, required this.label, required this.callBack, changed});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide.none),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: label),
      validator: callBack,
    );
  }
}
