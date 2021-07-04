import 'package:flutter/material.dart';
import 'package:openvpnapppractice/helpers/colors.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.signal_wifi_connected_no_internet_4,
              size: 100,
              color: Colors.white,
            ),
            Container(
              child: Text(
                'No internet detected\n Cannot run VPN \n Enabling internet will redirect to main screen',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ]),
    );
  }
}
