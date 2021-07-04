import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen.dart';
import 'package:openvpnapppractice/screens/wrapper_screen/wrapper_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    permissionsCheck();
  }

  permissionsCheck() async {
    if (await Permission.storage.isGranted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WrapperScreen()));
    } else {
      PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WrapperScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WrapperScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
