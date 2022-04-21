import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/SignIn%20Screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Activities/Home Screen/home_screen.dart';
import 'Screens/Welcome Screen/welcomescreen.dart';

class CheckSessionScreen extends StatelessWidget {
  const CheckSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          SharedPreferences prefs = snapshot.data;
          String? username = prefs.getString("username");
          String? password = prefs.getString("password");
          if (username != null && password != null) {
            return FutureBuilder(
              future: FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: username, password: password),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return HomeScreen(title: "");
                }
                return WelcomePage(title: '');
              },
            );
          }
        }
        return WelcomePage(title: '');
      },
    );
  }
}
