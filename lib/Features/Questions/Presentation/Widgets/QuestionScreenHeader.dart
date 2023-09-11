import 'package:flutter/material.dart';
import 'package:viswals_test/Core/Widgets/AppTextWidget.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/QuestionsProgressIndicator.dart';

/// A common widger for question screen which displays progress of questions
class QuestionScreenHeader extends StatelessWidget {
  const QuestionScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            flex: 1,
            child: AppTextWidget(
              txtTitle: "Document Details",
              fontSize: 24,
              maxLine: 2,
              fontWeight: FontWeight.w900,
            )),
        Expanded(child: QuestionsprogressIndicator()),
      ],
    );
  }
}
