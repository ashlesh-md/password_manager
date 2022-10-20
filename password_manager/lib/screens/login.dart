import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/database/model/user.dart';
import 'package:password_manager/screens/social_media.dart';
import '../database/database_service.dart';
import '../utils/validation.dart';

class Login extends StatefulWidget {
  Function indexChange;
  Login({required this.indexChange});
  User? user;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with Validation {
  final _formKey = GlobalKey<FormState>();
  static String routeName = "/login";
  bool watchable = false;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
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
                    validator: (value) => passwordValidator(value!),
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: !watchable,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(8.0),
                      labelText: 'Mpin',
                      suffixIcon: IconButton(
                        icon: Icon(
                          watchable ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            watchable = !watchable;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: GestureDetector(
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => widget.indexChange(),
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
                  print(phoneController.text);
                  DatabaseService.instance
                      .getUserByData(phoneController.text.trim() as String,
                          passwordController.text.trim() as String)
                      .then((value) => {
                            Fluttertoast.showToast(
                              msg: value,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black.withOpacity(0.75),
                              textColor: Colors.white,
                            ),
                            if (value == 'Sign In successfull')
                              {
                                Navigator.pushNamed(
                                    context, SocialMedia.routeName)
                              }
                          });
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
