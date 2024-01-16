import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 48.h,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Text(
                  'Your Tomorrow Starts Today: Cancer Detection Matters',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    color: const Color(0xFF2A2A2A),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 38.h,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 320.h,
                    width: 320.w,
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: imagePaths.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(22.18),
                            child: Container(
                                height: 320.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(imagePaths[index]))),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/ovalvector.png"))),
                                )),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 30.h,
                    left: 125.w,
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
                height: 19.h,
              ),
              SizedBox(
                height: 48.h,
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
                              fontSize: 16.sp),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Image.asset("assets/arrow.png"),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    textAlign: TextAlign.center,
                    "Register an account",
                    style: GoogleFonts.openSans(
                        decoration: TextDecoration.underline,
                        color: const Color(0xff2A2A2A),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
