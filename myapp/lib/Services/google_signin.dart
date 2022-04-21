import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Activities/Home Screen/home_screen.dart';




Future<void> signInWithGoogle(BuildContext context) async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth =
  await googleUser!.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,
    accessToken: googleAuth.accessToken,
  );
  FirebaseAuth.instance.signInWithCredential(credential).then((uid) => {
    Fluttertoast.showToast(msg: "Login Successful"),
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(title: ""))),
  });
}
