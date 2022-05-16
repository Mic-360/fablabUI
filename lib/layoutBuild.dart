import 'dart:async';
import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fablab/utils/carousel.dart';
import 'package:fablab/utils/eventBox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutBuild extends StatefulWidget {
  const LayoutBuild({super.key});

  @override
  State<LayoutBuild> createState() => _LayoutBuildState();
}

class _LayoutBuildState extends State<LayoutBuild>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 450,
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                spawnMaxRadius: 50,
                spawnMinSpeed: 10.00,
                particleCount: 68,
                spawnMaxSpeed: 50,
                minOpacity: 0.3,
                spawnOpacity: 0.4,
                baseColor: Colors.green,
              ),
            ),
            vsync: this,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 4),
                    blurRadius: 1,
                    color: Colors.purpleAccent.withOpacity(0.1),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      EventBox(),
                      Container(
                        width: 500,
                        child: Carousel(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
