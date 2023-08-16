
import 'package:ai_app/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'help.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  TtoS pk = TtoS();
  final TextEditingController _text = new TextEditingController();
  FlutterTts flutterTts = FlutterTts();
  

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _text.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 250, 241),
      appBar: AppBar(backgroundColor: Color.fromARGB(217, 47, 171, 134),
      actions: [
          IconButton(
              icon: Icon(
                  Icons.help_outline,
                  color:Colors.white,
                  size: 34.0),
              onPressed: (){
                  Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Help()));
              })]
          ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 80,
          ),
          Text(
            "Get Your Ears \n       Ready!",
            style: GoogleFonts.montserrat(
                color: Color.fromARGB(255, 1, 67, 38),
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
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
                controller: _text,
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
                  pk.sendtext(_text.text.toString());
                },
                child: Text(
                  "Process",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: Color.fromARGB(217, 47, 171, 134),
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
                onPressed: () {
                  pk.debugRootFiles(context);
                },
                child: Text(
                  "Generate",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
