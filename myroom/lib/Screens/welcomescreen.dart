import 'package:flutter/material.dart';
import 'package:myroom/Screens/login_screen.dart';
import 'package:myroom/Screens/registration_screen.dart';
import 'package:lottie/lottie.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required String title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Room Finder'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/json/lottie.json'),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RegistrationScreen()));
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

