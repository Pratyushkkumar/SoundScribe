import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

class TtoS {
  String b = '';
  final FirebaseFirestore __firestore;
  String audioUrl = '';
  String a = '';
  String downloadURL = "";
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String s = '';

  TtoS({
    FirebaseFirestore? firestore,
  }) : __firestore = FirebaseFirestore.instance;

  Future<void> debugRootFiles(BuildContext context) async {
// Create a reference to "file"14cYVS2qWkj3PdHSjoMB.mp3
    print(b);

    //print(s);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('Secret Code'), content: SelectableText("$b")));
  }

  Future<void> download(String x, BuildContext context) async {
    s = "temp/$x.mp3";
    FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
    firebase_storage.Reference storageRef =
        storage.refFromURL("gs://prettyutter.appspot.com");
    firebase_storage.Reference mountainsRef = storageRef.child(s);
    // print(mountainsRef);
    final p = await mountainsRef.getDownloadURL();
    //print(p);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('Audio Link'), content: SelectableText("$p")));

    //print('$s');
  }

  Future sendtext(String a) async {
    await __firestore.collection('T_to_S').add({
      'text': a,
      'languageCode': "en-US", // Optional if per-document overrides are enabled
      'ssmlGender': "MALE", // Optional if per-document overrides are enabled
      'audioEncoding': "MP3", // Optional if per-document overrides are enabled
      'voiceName':
          "en-US-Polyglot-1" // Optional if per-document overrides are enabled
    }).then((doc) {
      b = doc.id.toString();
    });

    // a = doc.toString().trim();
    //b = a.substring(7, a.length);
    print("uploaded");
    //debugRootFiles(b);
  }
}
