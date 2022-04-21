import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Services/UserService.dart';

import '../../Screens/SignIn Screen/login_screen.dart';

class DeleteForeverDialog extends StatefulWidget {
  const DeleteForeverDialog({Key? key}) : super(key: key);

  @override
  State<DeleteForeverDialog> createState() => _DeleteForeverDialogState();
}

class _DeleteForeverDialogState extends State<DeleteForeverDialog> {
  bool isDisabled = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        isDisabled ? Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        ): GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        isDisabled ? Container(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        ): GestureDetector(
          onTap: () async {
            setState(() {
              isDisabled = true;
            });
            await UserService().deleteUser();
            await FirebaseAuth.instance.currentUser?.delete();
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()),
                    (route) => true);
            setState(() {
              isDisabled = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Confirm",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
      title: Text("Are you sure you want to delete this account"),

    );
  }
}
