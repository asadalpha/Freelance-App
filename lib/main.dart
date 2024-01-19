import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onco_app/UI/pages/login_in_screen.dart';
import 'package:onco_app/UI/pages/register_screen.dart';
import 'package:onco_app/UI/pages/scan_screen.dart';
import 'package:onco_app/UI/pages/sign_up_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(),
          home: child,
        );
      },
      child: const RegisterScreen(),
      // child: ScanScreen(),
    );
  }
}
