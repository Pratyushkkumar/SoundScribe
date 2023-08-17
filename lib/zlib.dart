import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Zli extends StatefulWidget {
   Zli({super.key});

  @override
  State<Zli> createState() => _ZliState();
}

class _ZliState extends State<Zli> {
    WebViewController _webview=WebViewController();

  @override
  void initState() {
    super.initState();
    _webview = WebViewController()
      ..loadRequest(
        Uri.parse('https://z-lib.is/'),
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(217, 47, 171, 134),title: Text('Zlibrary'),),
      body:WebViewWidget(controller: _webview) ,
    );

  }
}
