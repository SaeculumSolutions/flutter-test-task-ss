import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viswals_test/Core/Widgets/AppButtonWidget.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

class QuestionsBottomButton extends StatelessWidget {
  const QuestionsBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionsProvider>(builder: (context, quesProvider, child) {
      if (quesProvider.selectedQuestion?.id == 0) {
        return AppButtonWidget(
          onPressed: () {
            quesProvider.nextQues();
          },
          enabled: quesProvider.selectedDocument != null,
          btnName: "Next",
          buttonColorTheme: ButtonColorTheme.Pink,
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: AppButtonWidget(
              onPressed: () {
                quesProvider.previousQuestion();
              },
              enabled: quesProvider.selectedDocument != null,
              btnName: "PREV",
              buttonColorTheme: ButtonColorTheme.Grey,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child: AppButtonWidget(
              onPressed: () async {
                quesProvider.nextQues();

                if (quesProvider.selectedQuestion?.id == 2 &&
                    quesProvider.selectedCountry != null) {
                  context.pop();
                  return;
                }
              },
              enabled: quesProvider.isButtonEnabled(),
              btnName:
                  quesProvider.selectedQuestion?.id == 2 ? "FINISH" : "NEXT",
              buttonColorTheme: ButtonColorTheme.Pink,
            ),
          )
        ],
      );
    });
  }
}
