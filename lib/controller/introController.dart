// ignore_for_file: non_constant_identifier_names, prefer_final_fields, deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:interview_app/models/questions.dart';
import 'package:interview_app/views/score/score_screen.dart';

// We use get package for our state management

class IntroController extends GetxController {
  RxBool selectedOptionbool = false.obs;
  RxBool selectedQuizTypebool = false.obs;
  String _selectedOptionType = "";
  String get selectedAns => this._selectedOptionType;

  String _selectedQuizType = "";
  String get selectedQuizType => this._selectedQuizType;

  int _selectedIndex = 12;
  int get selectedIndex => this._selectedIndex;

  void selectedType(String type, int index) {
    _selectedOptionType = type;
    _selectedIndex = index;
    selectedOptionbool.value = true;
  }

  void selectedQuizTypes(String type) {
    _selectedQuizType = type;
    selectedQuizTypebool.value = true;
  }
}
