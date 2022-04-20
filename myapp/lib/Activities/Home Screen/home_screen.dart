import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Advertisement/add_product.dart';
import '../Drawer/appDrawer.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Home();
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Welcome to Room Finder'),
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
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: const Text(
                      'SEARCH RESIDENCE',
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => const Home()));
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: const Text(
                      'ADVERTISE RESIDENCE',
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Advertise(() {})));
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
