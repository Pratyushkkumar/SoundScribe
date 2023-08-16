import 'package:ai_app/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 228, 250, 241),
      body: Column(
        
        children:[ SizedBox(height: 350,),Text("Let's Begin!",style: GoogleFonts.montserrat(color: Color.fromARGB(217, 16, 60, 47,),fontSize: 50,fontWeight: FontWeight.bold ),),
        SizedBox(height: 28,)
        ,Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 110,
            decoration: BoxDecoration(color: Color.fromARGB(217, 47, 171, 134),borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));},child: Text("LogIn",style: GoogleFonts.montserrat(color: Colors.white),))),
        ),
      ]
    ));
  }
}
