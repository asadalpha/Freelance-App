import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

var isLoading = false;

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    double progressValue = 1.0;

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: 360.w,
        height: 800.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/picture.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 24.h,
              left: 82.w,
              child: GestureDetector(
                onTap: () {
                  _showModalBottomSheet(context);
                },
                child: Container(
                  height: 41.h,
                  width: 197.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: isLoading
                            ? const Color(0xff3AC0A0)
                            : const Color(0xffFF616D),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      isLoading
                          ? Text(
                              "Signal strength: Good",
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            )
                          : Text(
                              "Signal strength: Poor",
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              bottom: 42.w,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                },
                child: Container(
                  height: 147.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: w * 0.02,
                        left: w * 0.04,
                        child: isLoading
                            ? Row(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 6,
                                        color: const Color(0xff3AC0A0),
                                        value: progressValue),
                                  ),
                                  SizedBox(width: w * 0.02),
                                  Text(
                                    '${(progressValue * 25).toStringAsFixed(0)}% Completed',
                                    style: GoogleFonts.openSans(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    "Calibration in progress....",
                                    style: GoogleFonts.openSans(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                      ),
                      Positioned(
                        top: w * 0.08,
                        left: w * 0.04,
                        child: SizedBox(
                          width: w * 0.8,
                          child: Text(
                            "During the measurement, please do not speak or move..",
                            style: GoogleFonts.openSans(
                                fontSize: 15.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Positioned(
                        top: w * 0.24,
                        left: w * 0.5,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.3,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                "Cancle Scan",
                                style: GoogleFonts.openSans(
                                    color: const Color(0xffF31F2E),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

void _showModalBottomSheet(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 178,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/exclamationIcon.png"),
            Text(
              "Scan Failed! Please try again..",
              style: GoogleFonts.openSans(
                  color: const Color(0xff2A2A2A),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 172,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Go Back",
                      style: GoogleFonts.openSans(
                          color: const Color(0xffF31F2E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showModalSheetForAnalysingData(context);
                  },
                  child: Container(
                    height: 50,
                    width: 172,
                    decoration: BoxDecoration(
                        color: const Color(0xffDC7D57),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Try Again",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

void _showModalSheetForAnalysingData(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 392,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/infographic.png"),
            Text(
              "Analysing Data",
              style: GoogleFonts.openSans(
                  color: const Color(0xff2A2A2A),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: w,
              child: Text(
                "Hold tight, the measurement\nresults are on the way",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: const Color(0xff2A2A2A),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    },
  );
}
