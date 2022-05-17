import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return CarouselDesktop();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return CarouselDesktop();
        } else {
          return CarouselMobile();
        }
      },
    );
  }
}

class CarouselDesktop extends StatefulWidget {
  const CarouselDesktop({super.key});

  @override
  State<CarouselDesktop> createState() => _CarouselDesktopState();
}

class _CarouselDesktopState extends State<CarouselDesktop> {
  final List<String> imageList = [
    'images/img (1).jpg',
    'images/img (2).jpg',
    'images/img (3).jpg',
    'images/img (4).jpg',
    'images/img (5).jpg',
    'images/img (9).jpg',
    'images/img (10).jpg',
    'images/img (11).jpg',
    'images/img (12).jpg',
    'images/img (13).jpg',
    'images/img (14).jpg',
    'images/img (15).jpg',
    'images/img (16).jpg',
    'images/img (17).jpg',
    'images/img (18).jpg',
    'images/img (21).jpg',
    'images/img (22).jpg',
    'images/img (23).jpg',
    'images/img (24).jpg',
    'images/img (25).jpg',
    'images/img (26).jpg',
    'images/img (27).jpg',
    'images/img (28).jpg',
    'images/img (29).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
        ),
        items: imageList
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(e),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CarouselMobile extends StatefulWidget {
  const CarouselMobile({super.key});

  @override
  State<CarouselMobile> createState() => _CarouselMobileState();
}

class _CarouselMobileState extends State<CarouselMobile> {
  final List<String> imageList = [
    'images/img (1).jpg',
    'images/img (2).jpg',
    'images/img (3).jpg',
    'images/img (4).jpg',
    'images/img (5).jpg',
    'images/img (9).jpg',
    'images/img (10).jpg',
    'images/img (11).jpg',
    'images/img (12).jpg',
    'images/img (13).jpg',
    'images/img (14).jpg',
    'images/img (15).jpg',
    'images/img (16).jpg',
    'images/img (17).jpg',
    'images/img (18).jpg',
    'images/img (21).jpg',
    'images/img (22).jpg',
    'images/img (23).jpg',
    'images/img (24).jpg',
    'images/img (25).jpg',
    'images/img (26).jpg',
    'images/img (27).jpg',
    'images/img (28).jpg',
    'images/img (29).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 35, 4, 0),
      width: MediaQuery.of(context).size.width / 2,
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
        ),
        items: imageList
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(e),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
