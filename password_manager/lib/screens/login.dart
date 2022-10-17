import 'package:flutter/material.dart';

import '../utils/button.dart';
import '../utils/routes.dart';
import '../utils/textField.dart';
import '../utils/validation.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with Validation {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    label: 'MPin',
                    callBack: (value) => passwordValidator(value),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Forgot your password?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
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
          const SizedBox(
            height: 50,
          ),
          Center(child: Image.asset('assets/Images/02/fingerprint_icon.png')),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: const [
                Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'USE YOUR FINGERPRINT TO LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
