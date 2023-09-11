import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viswals_test/Core/Constants/Enums/AppFontFamily.dart';
import 'package:viswals_test/Core/Router/RouteName.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Widgets/AppButtonWidget.dart';
import 'package:viswals_test/Core/Widgets/AppTextWidget.dart';
import 'package:viswals_test/Core/Widgets/CommonAppbarWidget.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/QuestionsProgressIndicator.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quesProvider = context.watch<QuestionsProvider>();
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Information",
        showBack: false,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 3),
              Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      const QuestionsprogressIndicator(
                        showIndicator: false,
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            AppTextWidget(
                              txtTitle: quesProvider.isCompleted
                                  ? "Congratulations"
                                  : "Document Details",
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                            24.verticalSpace,
                            AppTextWidget(
                              txtColor: AppColors.primary,
                              fontFamily: AppFontFamily.Roboto.name,
                              txtTitle: quesProvider.isCompleted
                                  ? "Quizz ${quesProvider.progressInPercentage.round()}% Completed"
                                  : "Let's complete the next few questions",
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              const Spacer(flex: 3),
              AppButtonWidget(
                onPressed: () {
                  if (quesProvider.isCompleted) {
                    quesProvider.resetTest();
                    return;
                  }
                  quesProvider.fetchDataFromLocal();

                  context.push(AppRouterName.questionScreen);
                },
                btnName: quesProvider.isCompleted ? "Re-START" : "START",
                buttonColorTheme: ButtonColorTheme.White,
              ),
              20.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
