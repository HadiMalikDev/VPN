//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:openvpnapppractice/helpers/failure.dart';

@singleton
class VPNFirebaseAuthentication {
  User currentUser;
  final FirebaseAuth auth = FirebaseAuth.instance;
  VPNFirebaseAuthentication() {
    init();
  }
  init() {
    currentUser = auth.currentUser;
  }

  registerUser({@required String email, @required String password}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      currentUser = credential.user;
    } on FirebaseException catch (e) {
      throw Failure(message: e.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  loginUser({@required String email, @required String password}) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      currentUser = credential.user;
    } on FirebaseException catch (e) {
      throw Failure(message: e.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
