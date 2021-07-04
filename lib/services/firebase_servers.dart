import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:openvpnapppractice/helpers/locator.dart';
import 'package:openvpnapppractice/models/server.dart';
import 'package:openvpnapppractice/services/firebase_authentication.dart';
import 'package:openvpnapppractice/services/firebase_storage.dart';

@singleton
class VPNServers {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('servers');
  List<Server> _servers = [];

  
  fetchServersList() async {
    _servers = [];
    late QuerySnapshot serversList;
    bool isPremium = _isPremiumUser();
    if (isPremium) {
      serversList =
          await _collectionReference.doc('premium').collection('servers').get();
    } else {
      print('free user');
      serversList =
          await _collectionReference.doc('free').collection('servers').get();
    }
    await _populateServersList(serversList.docs, isPremium: isPremium);
    return _servers;
  }

  _populateServersList(List<DocumentSnapshot> rawServers,
      {required bool isPremium}) async {
    VPNFirebaseStorage _storage = getIt<VPNFirebaseStorage>();
    for (DocumentSnapshot server in rawServers) {
      String serverInformation =
          await _storage.getServerInformation(isPremium, server['serverName']);
      _servers.add(Server(
        serverName: server['serverName'],
        serverInformation: serverInformation,
        countryCode: server['countryCode']
      ));
      print(_servers.length);
    }
  }

  _isPremiumUser() {
    VPNFirebaseAuthentication auth = getIt<VPNFirebaseAuthentication>();

    return !(auth.currentUser == null);
  }
}
