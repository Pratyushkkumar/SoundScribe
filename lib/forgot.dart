import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailcontroller = TextEditingController();
    Forgot() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailcontroller.text.trim());
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Reset Link Sent to Email"),
              );
            });
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(e.message.toString()),
              );
            });
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 248, 232),
        appBar: AppBar(backgroundColor:  Color.fromARGB(217, 47, 171, 134),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter Your Email Address",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
              child: TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Email",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(217, 47, 171, 134),),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.purple[300]),
              child: TextButton(
                onPressed: () {
                  Forgot();
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
