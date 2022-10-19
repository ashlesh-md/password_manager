import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/database/database_service.dart';
import 'package:password_manager/database/model/site.dart';
import 'package:password_manager/screens/add_site.dart';
import 'package:password_manager/screens/site_details.dart';

import '../data/get_data.dart';

main() => runApp(MaterialApp(
      home: SocialMedia(),
    ));

class SocialMedia extends StatefulWidget {
  bool _searchDetails = false;
  bool _dropdown = false;
  var data = DatabaseService.instance.getAllSite();
  String _drop_name = 'Social Media';
  static String routeName = "/social_media";

  @override
  _SocialMediaState createState() => _SocialMediaState();
}

const List<String> list = <String>[
  "Social Media",
  "E-commerce",
  "Games",
  "Health",
  "Others"
];
String dropdownValue = list.first;

var categories = ["Social Media", "E-commerce", "Games", "Health", "Others"];
int search = 0;

class _SocialMediaState extends State<SocialMedia> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AddSite.routeName);
            },
            backgroundColor: const Color.fromARGB(255, 14, 133, 255),
            child: const Icon(Icons.add)),
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        appBar: AppBar(
          leading: const SizedBox(),
          leadingWidth: 0,
          title: Row(
            children: [
              GestureDetector(
                child: Image.asset('assets/Images/06/app_bar/burger_menu.png'),
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              const SizedBox(
                width: 25,
              ),
              Image.asset('assets/Images/06/Group/PASS_MANAGER.png')
            ],
          ),
          actions: [
            GestureDetector(
              child: Image.asset('assets/Images/06/Group/search.png'),
              onTap: () => setState(() {
                widget._searchDetails = !widget._searchDetails;
              }),
            ),
            GestureDetector(
              child: Image.asset('assets/Images/06/Group/sync_icn.png'),
              onTap: () {
                setState(() {});
              },
            ),
            GestureDetector(
              child: Image.asset('assets/Images/06/Group/profile.png'),
              onTap: () {},
            )
          ],
        ),
        body: FutureBuilder(
          future:
              DatabaseService.instance.getDataByCategory(categories[search]),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Site>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error ${snapshot.error.toString()}');
              } else if (snapshot.hasData) {
                List<Site> data = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      widget._searchDetails
                          ? Container(
                              padding: const EdgeInsets.all(10),
                              height: 59,
                              color: Colors.grey.shade200,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextField(
                                      onSubmitted: (value) {},
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          hintText: "Type Keyword to search"),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.search,
                                          color: const Color(0xFF0E85FF)))
                                ],
                              ),
                            )
                          : const SizedBox(),
                      Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.only(
                                bottom: 20, left: 20, right: 80, top: 15),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: DropdownButton<String>(
                                alignment: Alignment.topRight,
                                value: dropdownValue,
                                icon: Container(
                                    color: Colors.transparent,
                                    alignment: Alignment.topRight,
                                    child: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Color(0xFF0E85FF),
                                    )),
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                    search = categories.indexOf(value);
                                    print('Search is ${search}');
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  // setState(() {
                                  //   print('Search is ${search}');
                                  //   search = categories.indexOf(value);
                                  // });
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Sites',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF3C4857),
                                            fontSize: 30)),
                                    Container(
                                      height: 4,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFFFFA222)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xFF0E85FF),
                                      ),
                                      child: Center(
                                          child: Text(
                                        '${snapshot.data!.length}',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      data.length > 0
                          ? Container(
                              height: MediaQuery.of(context).size.height - 198,
                              child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      child: SiteCard(data: data[i]),
                                      onDoubleTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SiteDetails(
                                                    id: data[i].id,
                                                  )),
                                        );
                                      },
                                    );
                                  }),
                            )
                          : const Text("nothing to show here")
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Empty data'));
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ));
  }
}

class SiteCard extends StatefulWidget {
  Site data;
  SiteCard({required this.data});

  @override
  State<SiteCard> createState() => _SiteCardState();
}

class _SiteCardState extends State<SiteCard> {
  String iconLink = "images/logo/facebook_logo.png";
  String getLogo(String socialMediaChoice) {
    if (socialMediaChoice == 'Facebook') {
      iconLink = jsonData[0]['image'] as String;
    } else if (socialMediaChoice == 'Instagram') {
      iconLink = jsonData[3]['image'] as String;
    } else if (socialMediaChoice == 'Youtube') {
      iconLink = jsonData[1]['image'] as String;
    } else {
      iconLink = jsonData[2]['image'] as String;
    }
    return iconLink;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      padding: const EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  getLogo(widget.data.socialMedia),
                ),
                GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.data.siteName,
                          style: const TextStyle(
                            color: Color(0xFF0E85FF),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.copy_all_rounded,
                                color: Color(0xFF0E85FF),
                              ),
                            ),
                            Text(
                              'Copy Password',
                              style: TextStyle(
                                  color:
                                      const Color(0xFF0E85FF).withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () async {
                      await Clipboard.setData(
                          ClipboardData(text: widget.data.password));
                      Fluttertoast.showToast(
                        msg: 'Copied Successfully',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black.withOpacity(0.75),
                        textColor: Colors.white,
                      );
                    })
              ],
            ),
          ),
          const Divider(),
          Text(
            '${widget.data.url}',
            style: TextStyle(
              color: const Color(0xFF3C4857).withOpacity(0.8),
              fontSize: 15.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
