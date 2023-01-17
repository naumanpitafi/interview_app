import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_app/constant/constant.dart';
import 'package:interview_app/controller/questionController.dart';
import 'package:interview_app/models/questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question? question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question!.question.toString(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question!.options!.length,
            (index) => Option(
              index: index,
              text: question!.options![index],
              press: () => _controller.checkAns(question!, index),
            ),
          ),
          Obx(() {
            if (_controller.isAnswered) {
              return Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: InkWell(
                    onTap: () {
                      //add to firebase
                      log("f_hit");
                      _controller.updateQuestionResult(
                          _controller.attemptingQ, _controller.selectedIndex);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: kBlackColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: _controller.button_loading.value
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                                "Next",
                                style:
                                    TextStyle(color: kBlackColor, fontSize: 16),
                              ),
                      ),
                    ),
                  ));
            } else {
              return const SizedBox(
                height: 1,
                width: 1,
              );
            }
          }),
        ],
      ),
    );
  }
}
