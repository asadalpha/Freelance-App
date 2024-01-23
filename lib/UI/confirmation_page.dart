import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 84.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 118, top: 118),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/openemail.png"))),
            ),
            SizedBox(
              height: 41.h,
            ),
            Text(
              'Confirmation your email address',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 24, left: 42, right: 42),
              child: Text(
                'We sent a confirmation email to :',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 0, left: 42, right: 42),
              child: Text(
                'akshay@onco-connect.com',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: Text(
                "Check your email and click on the \nonfirmation link to continue",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: Text(
                "Resend Email",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Color(0xff213D68),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
