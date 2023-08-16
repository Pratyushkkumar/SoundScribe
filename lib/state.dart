import 'package:ai_app/Login.dart';
import 'package:ai_app/Onboarding.dart';
import 'package:ai_app/Onboarding_pages/Page1.dart';
import 'package:ai_app/home2.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:ai_app/bottomnav.dart';


class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Onboarding();
        } else {
          return ButtomN();
        }
      },
    ));
  }
}
