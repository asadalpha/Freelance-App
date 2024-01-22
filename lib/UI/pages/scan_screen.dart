import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController? _controller; // Make it nullable
  late List<CameraDescription> cameras;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await initializeCamera();
  }

  Future<void> initializeCamera() async {
    // Check if camera permission is granted
    PermissionStatus status = await Permission.camera.status;

    if (status.isGranted) {
      // If permission is granted, initialize the camera
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _controller = CameraController(cameras[1], ResolutionPreset.medium);
        await _controller!.initialize();
        if (mounted) {
          setState(() {});
        }
      } else {
        // Handle the case where no cameras are available, e.g., show an error message.
        print("No cameras available");
      }
    } else {
      // If permission is not granted, request it
      await Permission.camera.request().then((PermissionStatus requestStatus) {
        if (requestStatus.isGranted) {
          initializeCamera();
        } else {
          // Handle the case where the user denied camera permission
          print("Camera permission denied");
        }
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    double progressValue = 1.0;

    return Scaffold(
      body: (_controller == null || !_controller!.value.isInitialized)
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: CameraPreview(_controller!),
                    ),
                    Positioned(
                      top: 32.h,
                      left: 81.w,
                      child: GestureDetector(
                        onTap: () {
                          _showModalBottomSheet(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 11, right: 16, bottom: 11, left: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 11),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: isLoading
                                      ? const Color(0xff3AC0A0)
                                      : const Color(0xffFF616D),
                                ),
                              ),
                              isLoading
                                  ? Text(
                                      "Signal strength: Good",
                                      style: GoogleFonts.openSans(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Text(
                                      "Signal strength: Poor",
                                      style: GoogleFonts.openSans(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.w,
                      bottom: 38.h,
                      right: 20.w,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoading = true;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16, left: 16, right: 16),
                            child: Column(
                              children: [
                                isLoading
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
                                                color: const Color(0xFF2A2A2A),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  width: w * 0.8,
                                  child: Text(
                                    "During the measurement, please do not speak or move..",
                                    style: GoogleFonts.openSans(
                                        color: const Color(0xB2213D68),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 10.5,
                                            right: 16,
                                            bottom: 10.5),
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Center(
                                          child: Text(
                                            "Cancel Scan",
                                            style: GoogleFonts.openSans(
                                                color: const Color(0xffF31F2E),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
    );
  }
}

void _showModalBottomSheet(BuildContext context) {
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
                  color: const Color(0xFF2A2A2A),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 50.5, top: 10.5, right: 50.5, bottom: 10.5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Go Back",
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showModalSheetForAnalysingData(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 50.5, top: 10.5, right: 50.5, bottom: 10.5),
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
                  fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 45, right: 45, top: 0, bottom: 32.6),
              child: Text(
                "Hold tight, the measurement\nresults are on the way",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      );
    },
  );
}
