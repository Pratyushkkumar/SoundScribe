import 'package:ai_app/class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Down extends StatelessWidget {
  Down({super.key});
  final TextEditingController _okok = TextEditingController();
  TtoS k = TtoS();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 250, 241),
      appBar: AppBar(backgroundColor: Color.fromARGB(217, 47, 171, 134)),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 200,
              child: TextField(
                expands: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Paste the Page here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                controller: _okok,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: Color.fromARGB(217, 47, 171, 134),
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
                onPressed: () {
                  // addTTSData();
                  k.download(_okok.text.toString(),context);
                },
                child: Text(
                  "Download",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
