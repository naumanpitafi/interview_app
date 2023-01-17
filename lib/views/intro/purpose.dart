// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:interview_app/constant/constant.dart';
import 'package:interview_app/controller/introController.dart';
import 'package:interview_app/enums/colors_const.dart';
import 'package:interview_app/utils/appRoutes.dart';
import 'package:interview_app/views/admin/dashboard.dart';
import 'package:interview_app/views/intro/introScreen.dart';
import 'package:interview_app/views/intro/quiztype.dart';
import 'package:interview_app/widgets/chooseType.dart';
import 'package:page_transition/page_transition.dart';

class PurposeScreen extends StatefulWidget {
  const PurposeScreen({super.key});

  @override
  State<PurposeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  @override
  Widget build(BuildContext context) {
    IntroController _introController = Get.find();
    return Scaffold(
      backgroundColor: splashbg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Choose an Option",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {
                _introController.selectedType("take", 1);
                AppRoutes.push(
                    context, PageTransitionType.rightToLeft, QuizTypeScreen());
              },
              child: ChooseType(
                text: "Take a Quiz",
                icon: Icons.edit,
              ),
            ),
            InkWell(
              onTap: () {
                _introController.selectedType("make", 2);
              },
              child: ChooseType(
                text: "Make a Quiz",
                icon: Icons.add,
              ),
            ),
            InkWell(
              onTap: () {
                // _introController.selectedType("make", 2);
                AppRoutes.push(
                    context, PageTransitionType.rightToLeft, DashboardAdmin());
              },
              child: ChooseType(
                text: "Admin Panel",
                icon: Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
