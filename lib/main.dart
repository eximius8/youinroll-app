import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter/service_locator.dart';
// screens
import 'package:tiktok_flutter/screens/screens.dart';
import './widgets/player_widget.dart';
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: FeedScreen(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white,// Color.fromRGBO(119, 44, 232, 1),
      ),
      routes: {
        //'/': (context) => LoginScreen(),
        '/': (context) => FeedScreen(),
      //  '/': (context) => VidListik(page: 1,),
        '/profile': (context) => LoginScreen(), //ProfileScreen(),
        '/search': (context) => SearchScreen(),
        '/chat': (context) => MessagesScreen(),
        '/dialog': (context) => DialogScreen(),
      }));
}
