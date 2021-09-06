import 'package:bingo/src/screens/home_scrren.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    var firebaseApp = await Firebase.initializeApp();

    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }
}
