

import 'package:flutter/material.dart';
import 'package:myapp/Screens/SignIn Screen/login_screen.dart';

import '../Home Screen/Post.dart';


class AppDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [

              ListTile(
                leading: Icon(Icons.person),
                title: const Text('My Post'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Post()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                          (route) => true);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
