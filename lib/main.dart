//@dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:openvpnapppractice/helpers/locator.dart';
import 'package:openvpnapppractice/screens/splash_screen/splashscreen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Widget _appCache;
  @override
  Widget build(BuildContext context) {
    if (_appCache == null) {
      print('Rebuilt');
      _appCache = BuildApp();
    }
    return _appCache;
  }
}

class BuildApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
