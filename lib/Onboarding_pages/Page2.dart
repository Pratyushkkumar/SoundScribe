import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 250, 241),
      body: Column(
        children: [
          SizedBox(height: 105),
          Text(
            "  PURPOSE",
            style: GoogleFonts.montserrat(
                fontSize: 45,
                color: Color.fromARGB(217, 16, 60, 47),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Text(
                "The purpose of our app, SoundScribe, is to seamlessly bridge the gap between written content and auditory experiences. By converting eBooks into engaging audio narratives, we empower users to absorb knowledge and enjoy stories effortlessly, whether during commutes, workouts, or leisurely moments. SoundScribe caters to diverse learning styles and busy lifestyles, transforming textual information into immersive spoken-word content. Our app fosters a deeper connection with literature, making it accessible to those with visual impairments or anyone seeking an alternative, enriching way to consume written material. Experience the joy of reading with your ears through the innovative convenience of SoundScribe.",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Color.fromARGB(217, 16, 60, 47),
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
