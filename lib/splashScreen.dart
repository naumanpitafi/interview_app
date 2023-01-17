import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:interview_app/controller/introController.dart';
import 'package:interview_app/controller/questionController.dart';
import 'package:interview_app/enums/colors_const.dart';
import 'package:interview_app/utils/appRoutes.dart';
import 'package:interview_app/views/intro/introScreen.dart';
import 'package:interview_app/views/intro/purpose.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  QuestionController _questionController = Get.put(QuestionController());
  IntroController _introController = Get.put(IntroController());
  @override
  void initState() {
    super.initState();
    _questionController.getData();

    Future.delayed(
        const Duration(milliseconds: 1500),
        () => AppRoutes.pushAndRemoveUntil(
            context, PageTransitionType.fade, PurposeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashbg,
      body: Center(
        child: Lottie.asset("assets/lottieFiles/splash.json",
            width: 300.w, height: 400.h),
      ),
    );
  }
}
