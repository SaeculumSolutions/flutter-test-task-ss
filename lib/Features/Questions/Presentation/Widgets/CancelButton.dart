import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Widgets/AppButtonWidget.dart';
/// Simple cancel button that will pop the dialog, modal or current screen
class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButtonWidget(
        buttonColorTheme: ButtonColorTheme.Black,
        borderColor: AppColors.transparent,
        textColor: AppColors.grey,
        onPressed: () {
          context.pop();
        },
        btnName: "CANCEL");
  }
}
