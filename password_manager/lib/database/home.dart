import 'package:flutter/material.dart';

import 'add_user/add_user.dart';
import 'database_service.dart';
import 'model/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
      ),
      body: FutureBuilder<List<User>>(
        future: DatabaseService.instance.getAllUser(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<User>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error.toString()}');
            } else if (snapshot.hasData) {
              List<User> users = snapshot.data!;
              return users.length > 0
                  ? ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () async {
                            var result = await showDialog(
                                context: context,
                                builder: (context) => AddUserScreen(
                                      user: users[i],
                                    ));

                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Id: ${users[i].id}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Phone Number: ${users[i].phone_number}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Password: ${users[i].password}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  height: 1,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Text("No users");
            } else {
              return const Center(child: Text('Empty data'));
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await showDialog(
              context: context, builder: (context) => AddUserScreen());
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
