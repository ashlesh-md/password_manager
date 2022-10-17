import 'package:flutter/material.dart';

import '../utils/button.dart';
import '../utils/routes.dart';
import '../utils/textField.dart';
import '../utils/validation.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with Validation {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                      label: 'Mobile Number',
                      callBack: (value) => nameValidation(value)),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    label: 'Enter 4 digit MPin',
                    callBack: (value) => passwordValidator(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    label: 'Re-Enter 4 digit MPin',
                    callBack: (value) => passwordValidator(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                  minimumSize: const Size(175, 50),
                  backgroundColor: Colors.white),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                }
              },
              child: const Text("SIGN IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 14, 133, 255))),
            ),
          ),
        ]),
      ),
    );
  }
}
