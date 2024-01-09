import 'package:flutter/material.dart';
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ///// --- onco logo
          SizedBox(
            height: h * 0.05,
          ),
          Container(
            height: h * 0.05,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/logo.png"))),
          ),
          SizedBox(
            height: h * 0.03,
          ),
          //// Login in account Text
          Text(
            "Login To Your Account",
            style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFDC7D57)),
          ),
          Text(
            textAlign: TextAlign.center,
            "Welcome back! Please log in to access your account.",
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),

          ///
          ///Text field 1
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Username",
                style: GoogleFonts.openSans(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              height: h / 14,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Password",
                style: GoogleFonts.openSans(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              height: h / 14,
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
                style: GoogleFonts.openSans(fontSize: 14),
              ),
              SizedBox(
                width: w * 0.3,
              ),
              GestureDetector(
                onTap: () {}, // forgot password screen and logic
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.openSans(fontSize: 14),
                ),
              ),
            ],
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w * 0.35,
                      ),
                      Text(
                        "Login",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: w * 0.25,
                      ),
                      Image.asset("assets/arrow.png")
                    ],
                  )),
            ),
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
                  width: w * 0.025,
                ),
                Text(
                  "Register",
                  style: GoogleFonts.openSans(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          /// login button
          ///
          /// dont have an acount text
        ],
      )),
    );
  }
}
