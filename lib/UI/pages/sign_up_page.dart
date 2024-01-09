import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:onco_app/UI/pages/login_in_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _controller = PageController();
  final List<String> imagePaths = [
    'assets/screenimage1.png',
    'assets/screenimage1.png',
    'assets/screenimage1.png',
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.1,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            Container(
              width: w,
              height: h * 0.18,
              padding: const EdgeInsets.only(left: 1, bottom: 13),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w * 0.8,
                    child: Text(
                      'Your Tomorrow Starts Today: Cancer Detection Matters',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        color: const Color(0xFF2A2A2A),
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Stack(
              children: [
                SizedBox(
                  height: h * 0.45,
                  width: w,
                  child: PageView.builder(
                      controller: _controller,
                      itemCount: imagePaths.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                            height: h,
                            width: w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(imagePaths[index]))),
                            child: Container(
                              height: h,
                              width: w,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image:
                                          AssetImage("assets/ovalvector.png"))),
                            ));
                      }),
                ),
                Positioned(
                  bottom: 15,
                  left: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: DotsIndicator(
                          dotsCount: imagePaths.length,
                          position: _currentIndex,
                          decorator: const DotsDecorator(
                            color: Colors.white,
                            activeColor: Color(0xFFDC7D57),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: h * 0.068,
                width: w - 40,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffDC7D57),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login to your account",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: w * 0.1,
                        ),
                        Image.asset("assets/arrow.png")
                      ],
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {}, // navigate to SignUpScreen
              child: Text(
                "Register an account",
                style: GoogleFonts.openSans(
                    decoration: TextDecoration.underline,
                    color: const Color(0xff2A2A2A),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
