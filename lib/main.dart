//@dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:openvpnapppractice/helpers/locator.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen.dart';
import 'package:openvpnapppractice/screens/splash_screen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
