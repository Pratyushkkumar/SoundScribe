import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 228, 250, 241),
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Column(
            children: [
              SizedBox(
                height: 85,
              ),
              Container(
                  height: 300,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Lottie.network(
                      'https://lottie.host/242f35d7-c001-49b8-a245-d526166e6885/kzceNWFD9u.json')),
              SizedBox(height: 54),
              Text(
                "SoundScribe!",
                style: GoogleFonts.montserrat(
                    fontSize: 50,
                    color: Color.fromARGB(217, 16, 60, 47),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15,),
              Text(
                "Turning The Pages \n   with Your Ears..",
                style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: Color.fromARGB(217, 16, 60, 47),
                    fontWeight: FontWeight.bold),
              )
        
            ],
          ),
        ),
      ],
    ));
  }
}
