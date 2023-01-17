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

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar
  RxList<Question> _questions = <Question>[].obs;
  var loading = true.obs;
  var button_loading = false.obs;
  AnimationController? _animationController;
  Animation? _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation!;

  PageController? _pageController;
  PageController get pageController => this._pageController!;

  List<Question> get questions => this._questions;

  RxBool _isAnswered = false.obs;
  bool get isAnswered => this._isAnswered.value;

  int? _correctAns;
  int get correctAns => this._numOfCorrectAns;

  int? _selectedAns;
  int get selectedAns => this._selectedAns!;

  int? _selectedIndex;
  int get selectedIndex => this._selectedIndex!;
  Question? _attemptingQ;
  Question get attemptingQ => this._attemptingQ!;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory

  void timestart() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    //super.onInit();
  }

  // // called just before the Controller is deleted from memory

  void onClosetime() {
    super.onClose();
    _animationController!.dispose();
    _pageController!.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _attemptingQ = question;
    _isAnswered.value = true;
    // _correctAns = question.answer;
    _selectedAns = selectedIndex;
    _selectedIndex = selectedIndex;
    if (question.answer == selectedIndex) _numOfCorrectAns++;

    // It will stop the counter
    //_animationController!.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    // Future.delayed(Duration(seconds: 1), () {
    //   nextQuestion();
    // });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered.value = false;
      _pageController!
          .nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController!.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      log(_numOfCorrectAns.toString());
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  Question questionsList = Question();

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('beginner');
  Future<void> getData() async {
    loading(true);
    QuerySnapshot querySnapshot = await _collectionRef.get();
    log(querySnapshot.docs.length.toString());
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      _questions.add(Question.fromMap(querySnapshot.docs[i].data()));
    }
    loading(false);
    log(loading.toString());
    log("this ${_questions.length}");
    _questions.refresh();
  }

  Future<void> updateQuestionResult(
      Question question, int selectedIndex) async {
    button_loading(true);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("Users")
        .doc("Flutter_Beginner")
        .collection("userName")
        .doc()
        .set({
      "question": question.question,
      "Correct_Answer": question.options![question.answer!],
      "Candidate_Answer": question.options![selectedAns],
      "Correct":
          question.options![selectedAns] == question.options![question.answer!]
              ? true
              : false
    }).then((value) => {button_loading(false), nextQuestion()});
  }
}
