import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnection/main.dart';
import 'package:firebaseconnection/models/user_model.dart';
import 'package:flutter/widgets.dart';

class AuthServices {
  final firebaseAuth = FirebaseAuth.instance;

  //sign in/login
  Future<User?> login(UserModel model) async {
    User? user0;

    firebaseAuth.authStateChanges().listen((event) async {
      if (event == null) {
        final user = await firebaseAuth.signInWithEmailAndPassword(
          email: model.email,
          password: model.password,
        );
        user0 = user.user;
        log("User ro'yxatdan o'tgan, login bo'ldi");
      }
    });
    return user0;
  }

  Future<User?> signUp(UserModel model) async{
    User? user0;

    firebaseAuth.authStateChanges().listen((event) async {
      if (event == null) {
        final user = await firebaseAuth.createUserWithEmailAndPassword(
          email: model.email,
          password: model.password,
        );
        user0 = user.user;
        log("User ro'yxatdan o'tgan, Sign up bo'ldi");
      }
    });
    return user0;
  }

  Stream<User?> checkUser() {
    return firebaseAuth.authStateChanges();
  }

//logout

  Future<void> logout(BuildContext context) async {
    await firebaseAuth.signOut().then((value) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(CheckUserPage.id, (Route route) => false);
    });
  }
}