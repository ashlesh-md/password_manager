import 'package:flutter/material.dart';
import 'package:password_manager/utils/site_text_field.dart';
import 'package:password_manager/utils/textField.dart';
import 'package:password_manager/utils/validation.dart';

import '../utils/routes.dart';

main() => runApp(const MaterialApp(
      home: AddSite(),
    ));

class AddSite extends StatelessWidget with Validation {
  const AddSite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Site'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'URL',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteTextField(
                        label: '', callBack: (value) => nameValidation(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Site Name',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteTextField(
                      label: '',
                      callBack: (value) => passwordValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sector/Folder',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteTextField(
                      label: '',
                      callBack: (value) => passwordValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'User Name',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteTextField(
                      label: '',
                      callBack: (value) => passwordValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Site Password',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteTextField(
                      label: '',
                      callBack: (value) => passwordValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Notes',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteTextField(
                      label: '',
                      callBack: (value) => passwordValidator(value),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                color: Color.fromARGB(255, 14, 133, 255),
                width: MediaQuery.of(context).size.width / 2 - 0.5,
                height: 55,
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }
                  },
                  child: Center(
                    child: const Text("Reset",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 1,
              ),
              Container(
                color: Color.fromARGB(255, 14, 133, 255),
                width: MediaQuery.of(context).size.width / 2 - 0.5,
                height: 55,
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }
                  },
                  child: Center(
                    child: const Text("Save",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
