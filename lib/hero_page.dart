import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/hero_page_video_card.dart';
import 'package:vlt_africa/responsive.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:ui' as ui;
// import 'dart:html' as html;

class HeroPage extends StatefulWidget {
  final bool isMobile;
  const HeroPage({
    super.key,
    required this.isMobile,
  }); //required this.isMobile

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.height * 0.65
          : 650,
      child: Stack(children: [
        Image.asset(
          width: MediaQuery.of(context).size.width,
          height: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.height * 0.65
              : 650,
          'assets/bgimages/hero_bg.jpeg',
          fit: BoxFit.cover,
        )
            .animate()
            .move(
                delay: 300.ms,
                duration: 600.ms), // runs after the above w/new duration

        Container(
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Build ',
                        style: TextStyle(
                            color: Colors.white,
                            // fontSize: widget.isMobile ? 24 : 40,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'Wealth',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                          TextSpan(
                            text: ' & ',
                          ),
                          TextSpan(
                            text: 'Time Freedom',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                          TextSpan(
                            text: ' By Tapping\nInto The Digital Economy ',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      'Earn from  a simple system that works 24/7 without creating any products or spending years learning complicated skills',
                      style: TextStyle(
                        // fontSize: widget.isMobile ? 16 : 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Experience timeless learning and earning',
                      style: TextStyle(
                          color: Colors.amber.withOpacity(0.9),
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 16),
                    // video card
                    HeroPageVideoCard(),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to courses
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CustomHexColors.fromHex('#d3efe9'),
                            foregroundColor: Colors.black,
                            side: BorderSide(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text(
                          'JOIN THE WEALTH SYSTEM NOW',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
// This widget is used to display the hero section of the home page.
// It includes a background image, a title, a subtitle, and a button to join the wealth system.