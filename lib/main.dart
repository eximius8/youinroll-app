import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter/service_locator.dart';
// screens
import 'package:tiktok_flutter/screens/screens.dart';

//import 'package:tiktok_flutter/screens/feed_screen.dart';
//import 'package:tiktok_flutter/screens/messages_screen.dart';
//import 'package:tiktok_flutter/screens/profile_screen.dart';
//import 'package:tiktok_flutter/screens/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: FeedScreen(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color.fromRGBO(119, 44, 232, 1),
      ),
      routes: {
        '/': (context) => LoginScreen(),
        //'/': (context) => FeedScreen(),
        '/profile': (context) => ProfileScreen(),
        '/search': (context) => SearchScreen(),
        '/chat': (context) => MessagesScreen(),
        '/dialog': (context) => DialogScreen(),
      }));
}
