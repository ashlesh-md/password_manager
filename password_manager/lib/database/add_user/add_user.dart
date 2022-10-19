import 'package:flutter/material.dart';
import 'package:password_manager/database/model/user.dart';
import 'package:password_manager/database/model/user.dart';

import '../database_service.dart';

class AddUserScreen extends StatefulWidget {
  User? user;

  AddUserScreen({this.user});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final salaryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.user != null) {
      fnameController.text = widget.user!.phone_number;
      lnameController.text = widget.user!.password;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.user == null ? "Add User" : "Update User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: fnameController,
              decoration: InputDecoration(hintText: "Please enter first name"),
            ),
            TextField(
              controller: lnameController,
              decoration: InputDecoration(hintText: "Please enter last name"),
            ),
            TextField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Please enter salary"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (widget.user != null) {
                          DatabaseService.instance.updateUser({
                            "id": widget.user!.id,
                            "phone_number": lnameController.text.trim(),
                            "password": salaryController.text.trim(),
                          });
                        } else {
                          DatabaseService.instance.createUser({
                            "phone_number": lnameController.text.trim(),
                            "password": salaryController.text.trim(),
                          });
                        }

                        Navigator.pop(context);
                      },
                      child: Text(widget.user != null ? "Update" : "Add")),
                ),
                const SizedBox(
                  width: 20,
                ),
                Visibility(
                  visible: widget.user != null,
                  child: Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          DatabaseService.instance.deleteUser(
                            widget.user!.id,
                          );

                          Navigator.pop(context);
                        },
                        child: Text("Delete")),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
