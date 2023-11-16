//import 'dart:js';

import 'package:chat_more/pages/register.dart';

import 'package:chat_more/services/authentication/auth_gate.dart';

import '../../chat_more/lib/services/authentication/auth_gate.dart';
import 'package:chat_more/services/authentication/auth_service.dart';
import 'package:chat_more/services/authentication/login_or_registration.dart';
import 'package:flutter/material.dart';
import 'package:chat_more/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );

}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(onTap: () {  },),
      //home: AuthGate(),
      //home:LoginPage(onTap: () {  },),
    );
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(onTap: () {  },),
      //get_permissions(),
      // Other widget configurations...
    );
  }
}
