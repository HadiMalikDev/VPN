import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen.dart';
import 'package:openvpnapppractice/screens/no_internet/no_internet_screen.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder:
          (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {

          if (snapshot.data != ConnectivityResult.none) {
            return MainScreen();
          } else {
            return NoInternetScreen();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
