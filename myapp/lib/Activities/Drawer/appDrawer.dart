import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/SignIn Screen/login_screen.dart';

import '../Home Screen/Post.dart';
import 'ChangePasswordDialog.dart';
import 'DeleteForeverDialog.dart';

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
                leading: const Icon(Icons.password),
                title: const Text('Change Password'),
                onTap: () async {
                Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) {
                      return ChangePasswordDialog();
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Account'),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed((Duration(milliseconds: 1))).then((value) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return DeleteForeverDialog();
                        });
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
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
