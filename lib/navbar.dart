import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fablab/layoutBuild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavBar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavBar();
        } else {
          return MobileNavBar();
        }
      },
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 70, left: 50, right: 30),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset('logo.png'),
                          ),
                          Column(
                            children: [
                              Text(
                                "S'O'A Fablab",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2, 2),
                                          color: Colors.grey.shade500,
                                          blurRadius: 5,
                                        ),
                                      ],
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 80),
                                ),
                              ),
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Powered by Karkhana',
                                    textStyle: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    speed: const Duration(milliseconds: 150),
                                  ),
                                ],
                                totalRepeatCount: 1000,
                                pause: const Duration(milliseconds: 10),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              ),
                            ],
                          )
                        ],
                      ),
                      TextLiquidFill(
                        waveDuration: Duration(seconds: 3),
                        loadDuration: Duration(hours: 3),
                        loadUntil: 1.0,
                        text: "S'O'A FABLAB",
                        waveColor: Colors.blue.shade500,
                        boxBackgroundColor: Colors.transparent,
                        textStyle: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                        ),
                        boxWidth: 600,
                        boxHeight: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        padding: EdgeInsets.only(top: 30, left: 35),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FlickerAnimatedText(
                              'OPEN',
                              speed: Duration(milliseconds: 1000),
                              entryEnd: 1,
                              textStyle: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'images/QR.png',
                          height: MediaQuery.of(context).size.height / 6,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "S'O'A Fablab",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {},
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 30),
            MaterialButton(
              onPressed: () {},
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  ' About Us ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 30),
            MaterialButton(
              onPressed: () {},
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 30)
          ],
        ),
      ],
    ));
  }
}
