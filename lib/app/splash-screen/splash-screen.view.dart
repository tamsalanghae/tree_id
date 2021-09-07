import 'dart:async';

import 'package:dalbergia_id/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<Timer> startTime() async => Timer(Duration(milliseconds: 1500), navigationPage);

  void navigationPage() => Get.toNamed("/home");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitThreeBounce(color: AppColor.accentColor, size: 30.sp),
    );
  }
}
