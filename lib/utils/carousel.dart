import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
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
