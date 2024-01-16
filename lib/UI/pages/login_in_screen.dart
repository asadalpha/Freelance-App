import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwrodController = TextEditingController();
  bool checkboxvalue = false;
  bool obsecureText = true;
  Icon suffixIcon = const Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 106, top: 64),
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            SizedBox(
              height: 16.h,
            ),
            //// Login in account Text
            Text(
              textAlign: TextAlign.center,
              "Login To Your Account",
              style: GoogleFonts.openSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFDC7D57)),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              textAlign: TextAlign.center,
              "Welcome back! Please log in to access your account.",
              style: GoogleFonts.openSans(
                fontSize: 16.sp,
                color: const Color(0xff2F3036),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Username",
              style: GoogleFonts.openSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2E3036),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                hintText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xff213D68))),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff213D68)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Password",
              style: GoogleFonts.openSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2E3036),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),

            TextFormField(
              controller: passwrodController,
              obscureText: obsecureText,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff213D68)),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff213D68)),
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: suffixIcon,
                  onPressed: () {
                    setState(() {
                      obsecureText = !obsecureText;
                      suffixIcon = obsecureText == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility);
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: Checkbox(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF213D68)),
                              borderRadius: BorderRadius.circular(4)),
                          activeColor: const Color(0xff213D68),
                          value: checkboxvalue,
                          onChanged: (value) {
                            setState(() {
                              checkboxvalue = !checkboxvalue;
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Remember Me",
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          color: const Color(0xff7A8BA4),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0xff7A8BA4)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 48.h,
              width: 320.w,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120.w,
                      ),
                      Text(
                        "Login",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16.sp),
                      ),
                      //const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 86),
                        child: Image.asset("assets/arrow.png"),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.openSans(
                        fontSize: 16, color: const Color(0xff2A2A2A)),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Register",
                    style: GoogleFonts.openSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff213D68)),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
