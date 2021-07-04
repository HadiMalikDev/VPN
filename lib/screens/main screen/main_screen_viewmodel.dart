import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:openvpnapppractice/helpers/locator.dart';
import 'package:openvpnapppractice/models/server.dart';
import 'package:openvpnapppractice/services/firebase_servers.dart';
import 'package:openvpnapppractice/services/openvpn.dart';
import 'package:stacked/stacked.dart';

enum ConnectionStatus { Disconnected, Connecting, Connected }

class MainScreenViewModel extends BaseViewModel {
  int selected = 0;
  OpenVPN _vpn = getIt<OpenVPN>();
  ConnectionStatus connectionStatus = ConnectionStatus.Disconnected;
  List<Server> servers = [];
  String currentIPAddress='';
  Stream<String> get vpnStatus {
    return _vpn.vpnStatusUpdate().map(_mapVPNStatus);
  }
  MainScreenViewModel(){
    getIPAddress();
    
  }
  String _mapVPNStatus(event) {
    switch (event) {
      case "AUTH":
        return "Authenticating";
      case "TCP_CONNECT":
        return "Connecting";
      case "WAIT":
        return "Waiting";
      case "AUTH":
        return "Authenticating";
      case "GET_CONFIG":
        return "Getting client configuration";
      case "ASSIGN_IP":
        return "Assigning new IP";
      case "VPN_GENERATE_CONIG":
        return "Generating VPN Configuration";
      case "CONNECTED":
        return "Connection successfully established";
      case "DISCONNECTED":
        return "Connection successfully terminated";
      default:
        return "";
    }
  }

  startVPN() async {
    try {
      if (!_vpn.isInitialized) await _vpn.init();
      connectionStatus = ConnectionStatus.Connecting;
      notifyListeners();
      await _vpn.loadVPNProfile(_getServerInformation());
      await _checkIfConnected();
    } catch (e) {
      connectionStatus = ConnectionStatus.Disconnected;
    }
  }
  getIPAddress()async{
    currentIPAddress='Fetching IP Address...';
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 500));
    currentIPAddress= await Ipify.ipv64();
    notifyListeners();
  }
  _getServerInformation() {
    return servers[selected].serverInformation;
  }
  
  stopVPN() async {
    try {
      await _vpn.stopVPN();
      connectionStatus = ConnectionStatus.Disconnected;
      notifyListeners();
      getIPAddress();
    } catch (e) {
      rethrow;
    }
  }

  _checkIfConnected() async {
    late StreamSubscription subscription;
    subscription = _vpn.controller.stream.listen((event) async {
      if (event == "CONNECTED") {
        connectionStatus = ConnectionStatus.Connected;
        notifyListeners();
        await subscription.cancel();
        getIPAddress();
        return;

      }
    });
  }

  initServers() async {
    await runBusyFuture(getServers(), throwException: true);
    notifyListeners();
  }

  getServers() async {
    servers = await getIt<VPNServers>().fetchServersList();
  }

  updateSelected(int index) {
    selected = index;
    notifyListeners();
  }
}
