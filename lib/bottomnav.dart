import 'package:ai_app/home2.dart';
import 'package:ai_app/searchbooks.dart';
import 'package:ai_app/signout.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'download.dart';


class ButtomN extends StatefulWidget {
   ButtomN({super.key});

  @override
  State<ButtomN> createState() => _ButtomNState();
}

class _ButtomNState extends State<ButtomN> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [MyWidget(),Down(),BookSearchPage() ,Out()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: GNav(
          backgroundColor: Color.fromARGB(217, 47, 171, 134),
          selectedIndex: _selectedIndex,
          activeColor: Colors.white,
          color: Colors.white,
          gap: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          
          tabs: const [
            GButton(
              icon: Icons.circle,
              text: 'CodeGen',
            ),
            GButton(icon: Icons.download,text: 'Download',),
            GButton(icon: Icons.subject,text: 'Suggestions',),
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            
            
            
          ],
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
