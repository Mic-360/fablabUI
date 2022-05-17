import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EventBox extends StatelessWidget {
  const EventBox({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return EventsDesktop();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return EventsDesktop();
        } else {
          return EventsMobile();
        }
      },
    );
  }
}

class EventsDesktop extends StatefulWidget {
  const EventsDesktop({super.key});

  @override
  State<EventsDesktop> createState() => _EventsDesktopState();
}

class _EventsDesktopState extends State<EventsDesktop>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  String get countText {
    Duration countdown = _controller.duration! * _controller.value;
    return '${countdown.inMinutes}:${(countdown.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 60));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 370,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/card1.png'),
                fit: BoxFit.cover,
                opacity: 1),
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.calendarCheck,
                    size: 50,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      'Upcoming Events',
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Design & Thinking',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.reverse(
                          from: _controller.value == 0.0
                              ? 1.0
                              : _controller.value);
                    },
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Text(
                        countText,
                        style: GoogleFonts.cabin(
                          color: Colors.blueAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText(
                              'Robotics & Automation',
                              textStyle: GoogleFonts.lato(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                            RotateAnimatedText(
                              'Ai & ML Workshop',
                              textStyle: GoogleFonts.lato(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                            RotateAnimatedText(
                              'Learn & Do Drones',
                              textStyle: GoogleFonts.lato(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventsMobile extends StatefulWidget {
  const EventsMobile({super.key});

  @override
  State<EventsMobile> createState() => _EventsMobileState();
}

class _EventsMobileState extends State<EventsMobile>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  String get countText {
    Duration countdown = _controller.duration! * _controller.value;
    return '${countdown.inMinutes}:${(countdown.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 60));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/card1.png',

                ),
                fit: BoxFit.cover,
                opacity: 1),
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    FontAwesomeIcons.calendarCheck,
                    size: 40,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      'Upcoming Events',
                      style: GoogleFonts.montserrat(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Design & Thinking',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.reverse(
                          from: _controller.value == 0.0
                              ? 1.0
                              : _controller.value);
                    },
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Text(
                        countText,
                        style: GoogleFonts.cabin(
                          color: Colors.blueAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText(
                              'Robotics & Automation',
                              textStyle: GoogleFonts.lato(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                            RotateAnimatedText(
                              'Ai & ML Workshop',
                              textStyle: GoogleFonts.lato(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                            RotateAnimatedText(
                              'Learn & Do Drones',
                              textStyle: GoogleFonts.lato(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
