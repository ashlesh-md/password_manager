import 'package:flutter/material.dart';
import 'package:password_manager/data/get_data.dart';
import 'package:password_manager/screens/social_media.dart';
import 'package:password_manager/utils/validation.dart';

import '../database/database_service.dart';
import '../utils/site_text_field.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class AddSite extends StatefulWidget {
  static String routeName = "/add_details";
  static List<int> cardIds = [];
  String myValue = "Social Media";
  bool isEditable = false;

  @override
  State<AddSite> createState() => _AddSiteState();
}

class _AddSiteState extends State<AddSite> with Validation {
  TextEditingController UrlController = TextEditingController();
  TextEditingController SiteNameController = TextEditingController();
  var SectorController;
  TextEditingController UserNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController NotesController = TextEditingController();
  var categories = ["Social Media", "E-commerce", "Games", "Health", "Others"];
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text("Add Site"), const Text("Edit")],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'URL',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: UrlController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: ''),
                      validator: (value) => checkSize(value),
                    ),
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
                    TextFormField(
                      controller: SiteNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: ''),
                      validator: (value) => checkSize(value),
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
                    SizedBox(
                        child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      value: 2,
                      items: const <DropdownMenuItem<int>>[
                        DropdownMenuItem<int>(
                          value: 0,
                          child: Text("Social Media"),
                        ),
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text("E-commerce"),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text("Games"),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text("Health"),
                        ),
                        DropdownMenuItem<int>(
                          value: 4,
                          child: Text("Others"),
                        ),
                      ],
                      onChanged: (int? value) {
                        widget.myValue = categories[value ?? 0];
                      },
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Social Media',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      value: 2,
                      items: const <DropdownMenuItem<int>>[
                        DropdownMenuItem<int>(
                          value: 0,
                          child: Text("Facebook"),
                        ),
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text("Youtube"),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text("Twitter"),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text("Instagram"),
                        ),
                        DropdownMenuItem<int>(
                          value: 4,
                          child: Text("Pintrest"),
                        ),
                      ],
                      onChanged: (int? value) {},
                    )),
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
                    TextFormField(
                      controller: UserNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: ''),
                      validator: (value) => nameValidation(value),
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
                    TextFormField(
                      controller: PasswordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: ''),
                      validator: (value) => passwordValidator(value),
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
                    TextFormField(
                      controller: NotesController,
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: ''),
                      validator: (value) => checkSize(value),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  color: const Color.fromARGB(255, 14, 133, 255),
                  width: MediaQuery.of(context).size.width / 2 - 0.5,
                  height: 55,
                  child: GestureDetector(
                    onTap: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Center(
                      child: Text("Reset",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                  width: 1,
                ),
                Container(
                  color: const Color.fromARGB(255, 14, 133, 255),
                  width: MediaQuery.of(context).size.width / 2 - 0.5,
                  height: 55,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          DatabaseService.instance.createSite({
                            "url": UrlController.text,
                            "siteName": SiteNameController.text,
                            "sector": widget.myValue,
                            "socialMedia": 'Facebook',
                            "username": UserNameController.text,
                            "password": PasswordController.text,
                            "notes": NotesController.text,
                          });
                          DatabaseService.instance.getAllSite();
                          Navigator.pushNamed(context, SocialMedia.routeName);
                        });
                      }
                    },
                    child: const Center(
                      child: Text("Save",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
