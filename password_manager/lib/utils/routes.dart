import 'package:flutter/widgets.dart';
import 'package:password_manager/screens/home.dart';
import 'package:password_manager/screens/site_details.dart';
import 'package:password_manager/screens/social_media.dart';

import '../screens/add_site.dart';

final Map<String, WidgetBuilder> routes = {
  AddSite.routeName: (context) => AddSite(),
  Home.routeName: (context) => const Home(),
  SocialMedia.routeName: (context) => SocialMedia()
};
