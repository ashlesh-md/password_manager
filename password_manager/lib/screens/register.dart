import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/database/database_service.dart';
import 'package:password_manager/database/model/user.dart';
import 'package:password_manager/screens/site_details.dart';
import 'package:password_manager/screens/social_media.dart';

import '../utils/button.dart';
import '../utils/routes.dart';
import '../utils/textField.dart';
import '../utils/validation.dart';

class Register extends StatefulWidget {
  User? user;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with Validation {
  final _formKey = GlobalKey<FormState>();
  static String routeName = "/register";

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.user != null) {
      phoneController.text = widget.user!.phone_number;
      passwordController.text = widget.user!.password;

      setState(() {});
    }
  }

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
                  TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Mobile Number'),
                      validator: (value) => phoneNumberValidator(value!)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Mpin'),
                    validator: (value) => checkSize(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Re-Enter 4 digit MPin'),
                    validator: (value) => checkSize(value),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 170),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          minimumSize: const Size(175, 50),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          DatabaseService.instance.createUser({
                            "phone_number": phoneController.text.trim(),
                            "password": passwordController.text.trim(),
                          });
                          DatabaseService.instance.getAllUser();
                          Fluttertoast.showToast(
                            msg: 'Sign Up Successful',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.black.withOpacity(0.75),
                            textColor: Colors.white,
                          );
                          Navigator.pushNamed(context, SocialMedia.routeName);
                        }
                      },
                      child: const Text("SIGN IN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 14, 133, 255))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
