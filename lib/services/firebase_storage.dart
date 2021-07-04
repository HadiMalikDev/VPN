import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@singleton
class VPNFirebaseStorage {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  VPNFirebaseStorage(){
    init();
  }
  init()async{
    Directory tmpDir=await getApplicationDocumentsDirectory();
    
  }

  getServerInformation(bool isPremium, String serverFileName) async {
    String location;
    if (isPremium) {
      location = 'premium/$serverFileName.ovpn';
    } else {
      location = 'free/$serverFileName.ovpn';
    }
    try {
      Directory tmpDir=await getApplicationDocumentsDirectory();
      File file = File('${tmpDir.path}/tmp.ovpn');
      print(location);
      await _firebaseStorage.ref(location).writeToFile(file);
      print('done');
      String contents=await file.readAsString();
      print('done(2)');
      await file.delete();
      print('done(3)');
      return contents;
    } catch (e) {}
  }
}
