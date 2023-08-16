import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 228, 250, 241),
      body:Column(
        children: [
          SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Instrutions to Use SoundScribe",style:GoogleFonts.montserrat(
                                  color: Color.fromARGB(255, 0, 90, 48),
                                  fontWeight: FontWeight.bold,fontSize: 20),),
            ],
          ),
          SizedBox(height: 20,),
          Text(" 1.Paste the eBook text in the convert page \n 2.Click on Progress Button then on Generate button \n 3.Copy the Secret code and paste it in download page  \n 4.Click on download and copy and paste link in broswer \n 5.Enjoy audio!",style:GoogleFonts.montserrat(
                  color: Colors.black,
                fontWeight: FontWeight.w600,fontSize: 12),)

        ],
      )
    );
  }
}
