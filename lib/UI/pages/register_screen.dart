import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onco_app/UI/pages/login_in_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteDomainController = TextEditingController();

  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 28.h),
              Text(
                'AURAEAI',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 78.h),
              Row(
                children: [
                  Text(
                    'Register An Account',
                    style: GoogleFonts.openSans(
                      color: const Color(0xFFDC7D57),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text(
                    'Name',
                    //textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2E3036),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 0, right: 8, bottom: 8),
                      child: TextFormField(
                        controller: firstNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your First Name';
                          }
                          // Add additional validation if needed
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          hintText: "First Name",
                          hintStyle: GoogleFonts.openSans(
                            color: const Color(0xBF7A8BA4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: const Color(0xff7A8BA4)
                                      .withOpacity(0.75))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff7A8BA4).withOpacity(0.75)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 0, bottom: 8),
                      child: TextFormField(
                        controller: secondNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Last Name';
                          }
                          // Add additional validation if needed
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          hintText: "Last Name",
                          hintStyle: GoogleFonts.openSans(
                            color: const Color(0xBF7A8BA4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: const Color(0xff7A8BA4)
                                      .withOpacity(0.75))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff7A8BA4).withOpacity(0.75)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 16.h),
              Row(
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2E3036),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add additional validation if needed
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  hintText: "Enter your corporate email",
                  hintStyle: GoogleFonts.openSans(
                    color: const Color(0xBF7A8BA4),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: const Color(0xff7A8BA4).withOpacity(0.75))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xff7A8BA4).withOpacity(0.75)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text(
                    'Website Domain',
                    //textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2E3036),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: websiteDomainController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Website Domain!';
                  }
                  // Add additional validation if needed
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  hintText: "Enter your website Domain",
                  hintStyle: GoogleFonts.openSans(
                    color: const Color(0xBF7A8BA4),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: const Color(0xff7A8BA4).withOpacity(0.75))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xff7A8BA4).withOpacity(0.75)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF7A8BA4)),
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: const Color(0xff213D68),
                      value: checkboxvalue,
                      onChanged: (value) {
                        setState(
                          () {
                            checkboxvalue = !checkboxvalue;
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 1, top: 42, bottom: 24),
                    child: RichText(
                      text: TextSpan(
                        text: "I've read and agree with the ",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff7A8BA4)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms and\nConditions ',
                            style: GoogleFonts.poppins(
                                color: Color(0xffDC7D57),
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.bold), // Style for colored words
                          ),
                          TextSpan(
                            text: 'and the ',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: "Privacy Policy.",
                            style: GoogleFonts.poppins(
                                color: Color(0xffDC7D57),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.h,
                width: 320.w,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffDC7D57),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120.w,
                        ),
                        Text(
                          "Next",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.openSans(
                        fontSize: 16, color: const Color(0xff2A2A2A)),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.openSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff213D68)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
