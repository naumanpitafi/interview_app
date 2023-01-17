import 'package:flutter/material.dart';
import 'package:interview_app/constant/constant.dart';
import 'package:interview_app/enums/colors_const.dart';
import 'package:interview_app/utils/appRoutes.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashbg,
      appBar: AppBar(
        backgroundColor: splashbg,
        leading: InkWell(
            onTap: () {
              AppRoutes.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            )),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Text(
                "Add Question",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                child: Text(
                  "Add Question",
                  style: TextStyle(
                      color: kBlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
