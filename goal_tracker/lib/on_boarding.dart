import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goal_tracker/authentication/login.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF53D8FB), Color(0xFFB844D4)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxHeight > constraints.maxWidth) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsGeometry.all(8.0),
                        child: Text(
                          'Goal Tracker',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w100,
                            // foreground: Paint()
                            //   ..shader = ui.Gradient.linear(
                            //     const Offset(0, 20),
                            //     const Offset(150, 20),
                            //     <Color>[
                            //       Color(0xFFDDD5D0),
                            //       Color(0xFF466365),
                            //     ],
                            //   )
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const Expanded(child: CarouselSliderController()),
                      OnBoardingButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Goal Tracker',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w100,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CarouselSliderController(),
                        const SizedBox(height: 20),
                        OnBoardingButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0x66000000),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'Get Started',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselSliderController extends StatefulWidget {
  const CarouselSliderController({super.key});

  @override
  State<CarouselSliderController> createState() =>
      _CarouselSliderControllerState();
}

class _CarouselSliderControllerState extends State<CarouselSliderController> {
  final Map<String, String> carouselData = {
    'assets/pin_your_goals.svg':
        'Pin your goals and track your progress. Let\'s start achieving them.',
    'assets/schedule.svg':
        'Plan your tasks. Stay organized to reach your destination faster.',
    'assets/book_lover.svg':
        'Read, learn, and grow. Your personal development is our priority.',
    'assets/visualize_success.svg':
        'Visualize your success. See your progress with insightful data.',
  };

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: List.generate(
              carouselData.length,
              (index) => CarouselSlides(
                illustration: SvgPicture.asset(
                  carouselData.keys.elementAt(index),
                  fit: BoxFit.contain,
                  height: 200,
                ),
                caption: carouselData.values.elementAt(index),
              ),
            ),
          ),
          const SizedBox(height: 20),
          DotsIndicator(
            dotsCount: carouselData.length,
            position: currentIndex.toDouble(),
            decorator: const DotsDecorator(
              color: Colors.white,
              activeColor: Color(0xFF7139FF),
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselSlides extends StatelessWidget {
  const CarouselSlides({
    super.key,
    required this.illustration,
    required this.caption,
  });

  final Widget illustration;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(flex: 2, child: illustration),
        const SizedBox(height: 20),
        Expanded(
          flex: 1,
          child: Text(
            caption,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
