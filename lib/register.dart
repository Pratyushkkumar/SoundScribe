import 'package:ai_app/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _cpasswordcontroller = TextEditingController();
  SignUp(BuildContext context) async {
    if (_passwordcontroller.text == _cpasswordcontroller.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailcontroller.text.trim(),
            password: _passwordcontroller.text.trim());
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Account Created Succesfully"),
              );
            });
      } on FirebaseAuthException catch (error) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(error.message.toString()),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Passwords Do Not Match"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 228, 250, 241),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
                height: 220,
                width: 220,
                child: Lottie.network(
                    'https://lottie.host/e0fb6dc2-5ba7-45ef-bd37-8d5658e3c964/2IiSDvbOiy.json')),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome!",
              style: GoogleFonts.montserrat(
                  color: Color.fromARGB(217, 16, 60, 47),
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            SizedBox(
              height: 15,
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
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      filled: true,
                    fillColor: Colors.white,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))))),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                    controller: _cpasswordcontroller,
                    decoration: InputDecoration(
                      filled: true,
                    fillColor: Colors.white,
                        hintText: "Re-enter Password",
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
                  "Register",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () {
                  SignUp(context);
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
                  "Already Member?",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 15,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("Login",
                      style: GoogleFonts.montserrat(
                          color: Color.fromARGB(255, 0, 90, 48),
                          fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
