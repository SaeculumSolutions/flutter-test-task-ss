import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viswals_test/Core/Widgets/AppButtonWidget.dart';
import 'package:viswals_test/Core/Widgets/AppTextFormField.dart';
import 'package:viswals_test/Core/Widgets/CommonAppbarWidget.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

class EnterNumberScreen extends StatelessWidget {
  const EnterNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Number",
        hideActions: true,
        onBack: () {
          // clearing numberController when user clicks back button
          context.read<QuestionsProvider>().numberController.clear();
        },
      ),
      body: WillPopScope(
        onWillPop: () async {
          // clearing numberController when user clicks back button of device
          context.read<QuestionsProvider>().numberController.clear();
          return true;
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                AppTextFormField(
                  hintText: "Number",
                  controller:
                      context.read<QuestionsProvider>().numberController,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onChanged: (val) {},
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const Spacer(),
                Consumer<QuestionsProvider>(builder: (context, ques, child) {
                  return AppButtonWidget(
                    onPressed: () {
                      context.pop();
                    },
                    btnName: "SAVE",
                    enabled: ques.numberController.text.length > 7,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
