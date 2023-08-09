import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  static const name = '/createpage';
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<CreatePage> {
  final newname = TextEditingController();
  final newuser = TextEditingController();
  final newpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, //chan bottom phia duoi troi len

        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Column(children: [
                const SizedBox(height: 70),
                const ListTile(
                  title: Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text('glad to see you!',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: newname,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: newuser,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: newpass,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          final data = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: newuser.text, password: newpass.text);
                          log(data.toString());
                          log(data.user.toString());
                        } on FirebaseAuthException catch (e) {
                          log(e.toString());
                        }
                      },
                      child: const Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 160,
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Stack(children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 320,
                  top: -10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
