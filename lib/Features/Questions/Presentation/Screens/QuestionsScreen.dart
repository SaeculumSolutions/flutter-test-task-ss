import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viswals_test/Core/Widgets/CommonAppbarWidget.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/QuestionField.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/QuestionScreenHeader.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Information"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            const QuestionScreenHeader(),
            50.verticalSpace,
            const QuestionField(),
          ],
        ),
      )),
    );
  }
}
