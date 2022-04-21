import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Screens/SignIn Screen/login_screen.dart';

class ChangePasswordDialog extends StatefulWidget {
  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool buttonDisabled = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        child: Material(
          child: Container(
            height: 250,
            width: 250,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Change Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                        autofocus: false,
                        controller: passwordController,
                        obscureText: !_passwordVisible,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Password is required for login");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Character)");
                          }
                        },
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.vpn_key),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    buttonDisabled ?Container(
                      margin: const EdgeInsets.all(12),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.1))
                        ],
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),
                    ): GestureDetector(
                      onTap: () async {
                        buttonDisabled = true;
                        setState(() {

                        });
                        if (_formKey.currentState!.validate()) {
                          await FirebaseAuth.instance.currentUser
                              ?.updatePassword(passwordController.text);
                          Navigator.pushAndRemoveUntil(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                                  (route) => true);
                        }

                        buttonDisabled = false;
                        setState(() {

                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 2),
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.1))
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Change",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
