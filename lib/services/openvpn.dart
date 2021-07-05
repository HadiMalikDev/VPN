//@dart=2.9
import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_openvpn/flutter_openvpn.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@singleton
class OpenVPN {
  String vpnStatus = 'Not Connected';
  bool isInitialized = false;
  StreamController<String> controller = StreamController<String>.broadcast();
  bool _vpnStarted = false;
  init() async {
    if (!isInitialized) {
      await FlutterOpenvpn.init();
      isInitialized = true;
    }
  }

  _test() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    File usaOVPNFile = File('${appDir.path}/opvnFile.ovpn');
    try {
      await FirebaseStorage.instance
          .ref('free/USA.ovpn')
          .writeToFile(usaOVPNFile);
    } catch (e) {}
    print(await usaOVPNFile.readAsString());
    return await usaOVPNFile.readAsString();
  }

  loadVPNProfile(String serverInformation) async {
    if (_vpnStarted == true) return;
    try {
      await FlutterOpenvpn.lunchVpn(
        serverInformation,
        (isProfileLoaded) => () {},
        (status) {
          print('vpnStatus new:' + vpnStatus);
          vpnStatus = status;
          controller.add(vpnStatus);
        },
        user: 'vpnbook',
        pass: 'e9s5w7s',
      );
      _vpnStarted = true;
    } catch (e) {}
  }

  stopVPN() async {
    if (_vpnStarted == false) return;
    try {
      await FlutterOpenvpn.stopVPN();
      _vpnStarted=false;
    } catch (e) {
      print(e);
    }
  }

  //Stream that returns the vpnStatus. Implemented since the original function did not possess one.
  Stream<String> vpnStatusUpdate() {
    return controller.stream;
  }

  //Used only when the user stops the VPN from the notification panel
  overrideStoppedStatus(bool isStarted){
    _vpnStarted=isStarted;
  }
}
