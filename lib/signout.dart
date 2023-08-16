import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Out extends StatelessWidget {
   Out({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 250, 241),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(217, 47, 171, 134),borderRadius: BorderRadius.circular(10)),
                height: 50,
                width: 105,
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text("Sign Out",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
