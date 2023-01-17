// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:interview_app/constant/constant.dart';
import 'package:interview_app/controller/introController.dart';
import 'package:interview_app/controller/questionController.dart';
import 'package:interview_app/enums/colors_const.dart';
import 'package:interview_app/utils/appRoutes.dart';
import 'package:interview_app/views/intro/introScreen.dart';
import 'package:interview_app/widgets/chooseType.dart';
import 'package:page_transition/page_transition.dart';

class QuizTypeScreen extends StatefulWidget {
  const QuizTypeScreen({super.key});

  @override
  State<QuizTypeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<QuizTypeScreen> {
  IntroController _introController = Get.find();
  QuestionController _questionController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                _introController.selectedQuizTypes("flutter");
                AppRoutes.push(
                    context, PageTransitionType.rightToLeft, QuizScreen());
              },
              child: ChooseType(
                text: "Flutter",
                icon: Icons.settings,
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     _introController.selectedType("make", 2);
            //   },
            //   child: ChooseType(
            //     text: "Make a Quiz",
            //     icon: Icons.add,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
