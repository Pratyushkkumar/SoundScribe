import 'package:ai_app/forgot.dart';
import 'package:ai_app/home2.dart';
import 'package:ai_app/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  SignIn(BuildContext context) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 250, 241),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Lottie.network(
                'https://lottie.host/04a10b4a-1ca7-43d3-80e8-59b014d65332/BLtiUSXBal.json'),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                    obscureText: true,
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))))),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  color: Color.fromARGB(217, 47, 171, 134),
                  borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                child: Text(
                  "LogIn",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () {
                  SignIn(context);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are You New?",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text("Register Now",
                          style: GoogleFonts.montserrat(
                              color: Color.fromARGB(255, 0, 90, 48),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));
              },
              child: Text("Forgot Password",
                  style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 0, 90, 48),
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
