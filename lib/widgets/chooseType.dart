// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:interview_app/constant/constant.dart';
import 'package:interview_app/controller/introController.dart';

class ChooseType extends StatelessWidget {
  String text;
  IconData icon;
  ChooseType({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IntroController introController = Get.find();
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: introController.selectedAns == ""
            ? Colors.white
            : Colors.transparent,
        border: Border.all(color: kBlackColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: kBlackColor, fontSize: 16),
          ),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              color: kBlackColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: kBlackColor),
            ),
            child:
                // getTheRightColor() == kGrayColor
                //     ? null
                //     :
                Icon(icon, size: 16),
          )
        ],
      ),
    );
  }
}
