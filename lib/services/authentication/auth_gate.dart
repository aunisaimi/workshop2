import 'package:chat_more/main.dart';
import 'package:chat_more/pages/home_page.dart';
import 'package:chat_more/services/authentication/login_or_registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../chat_more/lib/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          // user not logged in
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }

}

