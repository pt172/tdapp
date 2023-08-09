import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tdapp/firebase_options.dart';
import 'package:tdapp/page/create_page.dart';
import 'package:tdapp/page/home_page.dart';
import 'package:tdapp/page/login_page.dart';
import 'package:tdapp/page/task_add.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'loginpage',
      routes: {
        'loginpage': (context) => const LoginPage(),
        'createpage': (context) => const CreatePage(),
        'homepage': (context) => const HomePage(),
        'taskadd': (context) => const TaskAdd(),
      },
    );
  }
}
