import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/database/database_service.dart';
import 'package:password_manager/screens/social_media.dart';
import 'package:password_manager/utils/validation.dart';
import '../database/model/site.dart';
import '../utils/site_text_field.dart';

main() => MaterialApp(home: SiteDetails(id: 1));

class SiteDetails extends StatefulWidget {
  int id;
  SiteDetails({Key? key, required this.id}) : super(key: key);
  static String routeName = "/site_details";
  @override
  State<SiteDetails> createState() => _SiteDetailsState();
}

class _SiteDetailsState extends State<SiteDetails> with Validation {
  bool _fira = true;
  bool isEditable = false;

  TextEditingController mediaController = TextEditingController();
  TextEditingController sectorController = TextEditingController();

  TextEditingController UrlController = TextEditingController();
  TextEditingController SiteNameController = TextEditingController();
  String SectorController = '';
  String SocialMediaController = '';
  TextEditingController UserNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController NotesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseService.instance.getSite(widget.id),
      builder: (
        BuildContext context,
        snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error.toString()}');
          } else if (snapshot.hasData) {
            if (_fira == true) {
              _fira = false;
              Site? data = snapshot.data;
              UrlController.text = data!.url;
              SiteNameController.text = data.siteName;
              mediaController.text = data.socialMedia;
              sectorController.text = data.sector;
              UserNameController.text = data.username;
              PasswordController.text = data.password;
              NotesController.text = data.notes;
            }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: !isEditable
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Site Details"),
                          GestureDetector(
                            child: Text("Edit"),
                            onTap: () {
                              setState(() {
                                isEditable = true;
                              });
                            },
                          ),
                        ],
                      )
                    : Text('Edit'),
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
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
                            enabled: isEditable,
                            controller: UrlController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                            ),
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
                            enabled: isEditable,
                            controller: SiteNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                            ),
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
                          isEditable
                              ? SizedBox(
                                  child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
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
                                      child: Text("Healthcare"),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 2,
                                      child: Text("Games"),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 3,
                                      child: Text("E-commerce"),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 4,
                                      child: Text("Others"),
                                    ),
                                  ],
                                  onChanged: (int? value) {},
                                ))
                              : TextFormField(
                                  enabled: isEditable,
                                  controller: mediaController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                  ),
                                  validator: (value) =>
                                      passwordValidator(value),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Application',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          isEditable
                              ? SizedBox(
                                  child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
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
                                ))
                              : TextFormField(
                                  enabled: isEditable,
                                  controller: mediaController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                  ),
                                  validator: (value) =>
                                      passwordValidator(value),
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
                          TextFormField(
                            enabled: isEditable,
                            controller: UserNameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                            ),
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
                            enabled: isEditable,
                            controller: PasswordController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                            ),
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
                            enabled: isEditable,
                            controller: NotesController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                            ),
                            validator: (value) => checkSize(value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isEditable
                      ? GestureDetector(
                          onTap: () {
                            DatabaseService.instance.updateSite({
                              "id": widget.id,
                              "url": UrlController.text.trim(),
                              "siteName": SiteNameController.text.trim(),
                              "sector": SectorController.trim(),
                              "socialMedia": mediaController,
                              "username": UserNameController.text.trim(),
                              "password": PasswordController.text.trim(),
                              "notes": NotesController.text.trim(),
                            });
                            DatabaseService.instance.getAllSite();
                            Navigator.pushNamed(context, SocialMedia.routeName);
                            print('ID is ${widget.id}');
                          },
                          child: Container(
                            color: const Color.fromARGB(255, 14, 133, 255),
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child: const Center(
                              child: Text("Update",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white)),
                            ),
                          ),
                        )
                      : SizedBox()
                ]),
              ),
            );
          } else {
            return const Center(child: Text('Empty data'));
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
