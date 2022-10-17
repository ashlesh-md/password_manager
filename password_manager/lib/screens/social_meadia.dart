import 'package:flutter/material.dart';

main() => runApp(const MaterialApp(
      home: SocialMeadia(),
    ));

class SocialMeadia extends StatefulWidget {
  const SocialMeadia({Key? key}) : super(key: key);

  @override
  _SocialMeadiaState createState() => _SocialMeadiaState();
}

class _SocialMeadiaState extends State<SocialMeadia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/Images/06/app_bar/burger_menu.png'),
            const SizedBox(
              width: 25,
            ),
            Image.asset('assets/Images/06/Group/PASS_MANAGER.png')
          ],
        ),
        actions: [
          Image.asset('assets/Images/06/Group/search.png'),
          Image.asset('assets/Images/06/Group/sync_icn.png'),
          Image.asset('assets/Images/06/Group/profile.png')
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFFFA222)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      const Text(
                        'Social Media',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF3C4857),
                          fontSize: 20,
                        ),
                      ),
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
                        child: const Center(
                          child: Text(
                            '07',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/Images/06/heading/Path_Copy.png')
                    ],
                  ),
                )
              ],
            ),
            Site_Box(
              logo: 'assets/Images/06/01/Bitmap.png',
              name: 'Facebook',
              url: 'www.youtube.com',
            ),
            Site_Box(
              logo: 'assets/Images/06/01_copy_3/Bitmap.png',
              name: 'YouTube',
              url: 'www.youtube.com',
            ),
            Site_Box(
              logo: 'assets/Images/06/01_copy_4/Bitmap_Copy_2.png',
              name: 'Twitter',
              url: 'www.youtube.com',
            ),
            Site_Box(
              logo: 'assets/Images/06/01_copy/Bitmap.png',
              name: 'Instagram',
              url: 'www.youtube.com',
            ),
            Site_Box(
              logo: 'assets/Images/06/01_copy_5/Bitmap_Copy_4.png',
              name: 'Pinterest',
              url: 'www.youtube.com',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: const Color.fromARGB(255, 14, 133, 255),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Site_Box extends StatelessWidget {
  Site_Box({
    Key? key,
    required this.logo,
    required this.name,
    required this.url,
  }) : super(key: key);

  String logo, name, url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          height: MediaQuery.of(context).size.height / 6,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6 * 0.75,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45,
                        child: Image.asset(
                          logo,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 14, 133, 255),
                                fontSize: 24),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.copy,
                                color: Color.fromARGB(255, 42, 142, 241),
                              ),
                              Text(
                                'Copy Password',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 42, 142, 241),
                                    fontSize: 18),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(26, 178, 163, 163),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                height: MediaQuery.of(context).size.height / 6 * 0.25,
                child: Center(
                    child: Text(
                  url,
                  style: const TextStyle(fontSize: 18),
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
