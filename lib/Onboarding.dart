import 'package:ai_app/Login.dart';
import 'package:ai_app/Onboarding_pages/Page1.dart';
import 'package:ai_app/Onboarding_pages/Page2.dart';
import 'package:ai_app/Onboarding_pages/Page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  //track of last page
  bool page = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          //page_view
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  page = (index == 2);
                });
              },
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
            //dot indicator

            Container(
                alignment: Alignment(0, 0.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text("Skip",style: GoogleFonts.poppins(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),),
                      onTap: () {
                        _controller.jumpToPage(2);
                      },
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    SmoothPageIndicator(controller: _controller, count: 3,effect: SlideEffect(
                  activeDotColor: Color.fromARGB(217, 16, 60, 47),dotHeight: 10)),
                    SizedBox(
                      width: 90,
                    ),
                    page?
                         SizedBox(width: 10,)
                        : GestureDetector(
                            child: Text("Next",style: GoogleFonts.poppins(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),),
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                          )
                  ],
                ))
          ]),
    );
  }
}
