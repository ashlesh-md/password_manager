import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/screens/register.dart';

import 'login.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(70, 184, 252, 1),
            Color.fromRGBO(30, 136, 252, 1)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    "assets/Images/02/logo.png",
                    height: 150,
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.1,
                  // ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: const Text("SIGN IN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                              ),
                              GestureDetector(
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 3.5,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == 0
                                      ? const Color(0xFFFFA222)
                                      : Colors.transparent,
                                ),
                              ),
                              Container(
                                height: 3.5,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == 1
                                      ? const Color(0xFFFFA222)
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.white30,
                          ),
                          IndexedStack(
                            index: index,
                            children: [
                              Login(indexChange: () {
                                setState(() {
                                  index = 1;
                                });
                              }),
                              Register()
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
