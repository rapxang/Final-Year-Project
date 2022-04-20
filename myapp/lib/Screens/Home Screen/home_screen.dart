import 'package:flutter/material.dart';
import 'package:myapp/Screens/Search/search.dart';
import 'package:myapp/Screens/SignIn%20Screen/login_screen.dart';
import 'package:myapp/Screens/SignUp%20Screen/registration_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Screens/Home Screen/home.dart';
import 'package:myapp/Screens/Drawer/appDrawer.dart';
import 'package:myapp/Screens/Advertisement/add_product.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
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
                Lottie.asset('assets/json/search.json'),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'SEARCH RESIDENCE',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Home()));
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
                      'ADVERTISE RESIDENCE',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Advertise()));
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0)),

                ),
                Lottie.asset('assets/json/advertise.json'),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

