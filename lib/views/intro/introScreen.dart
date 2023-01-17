import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:interview_app/constant/constant.dart';
import 'package:interview_app/controller/questionController.dart';
import 'package:interview_app/utils/appRoutes.dart';
import 'package:interview_app/views/components/body.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuestionController _controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.timestart();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    return Obx(() {
      if (!_controller.loading.value) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  AppRoutes.pop(context);
                  _controller.onClosetime();
                },
                child: Icon(Icons.arrow_back_ios)),
            // Fluttter show the back button automatically
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              ElevatedButton(
                  onPressed: _controller.nextQuestion, child: Text("Next"))
            ],
          ),
          body: Body(),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
