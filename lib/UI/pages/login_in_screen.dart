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
  Icon suffixIcon = const Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 36.h,
              width: 108.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            SizedBox(
              height: 16.h,
            ),
            //// Login in account Text
            Text(
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
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),

            Row(
              children: [
                Text(
                  "Username",
                  style: GoogleFonts.openSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 48.h,
              width: 320.w,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Text(
                  "Password",
                  style: GoogleFonts.openSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 48.h,
              width: 320.w,
              child: TextField(
                controller: passwrodController,
                obscureText: obsecureText,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: suffixIcon,
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                        suffixIcon = const Icon(Icons.visibility_off);
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: const Color(0xff213D68),
                    value: checkboxvalue,
                    onChanged: (value) {
                      setState(() {
                        checkboxvalue = !checkboxvalue;
                      });
                    }),
                Text(
                  "Remember Me",
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, color: const Color(0xff7A8BA4)),
                ),
                SizedBox(
                  width: 65.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, color: const Color(0xff7A8BA4)),
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
                      const Spacer(),
                      Image.asset("assets/arrow.png")
                    ],
                  )),
            ),
            SizedBox(
              height: 12.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Register",
                    style: GoogleFonts.openSans(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
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
