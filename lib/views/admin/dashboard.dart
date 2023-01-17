import 'package:flutter/material.dart';
import 'package:interview_app/constant/constant.dart';
import 'package:interview_app/enums/colors_const.dart';
import 'package:interview_app/utils/appRoutes.dart';
import 'package:interview_app/views/admin/addQuestion.dart';
import 'package:interview_app/widgets/chooseType.dart';
import 'package:page_transition/page_transition.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
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
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Text(
                "Choose an Option",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            InkWell(
              onTap: () {
                AppRoutes.push(
                    context, PageTransitionType.rightToLeft, AddQuestion());
              },
              child: ChooseType(
                text: "Flutter",
                icon: Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
