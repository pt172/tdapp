// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tdapp/page/home_page.dart';

class LoginPage extends StatefulWidget {
  static const name = '/loginpage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 90),
                  const ListTile(
                    title: Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text('glad to see you!',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: pass,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          try {
                            final data = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text, password: pass.text);
                            log(data.toString());
                            log(data.user.toString());
                            if (data.user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const HomePage())));
                            }
                          } on FirebaseAuthException catch (e) {
                            log(e.toString());
                          }
                        },
                        child: const Text("LOGIN"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 270),
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'createpage');
                          },
                          child: const Text(
                            'CREATE ACCOUNT',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
