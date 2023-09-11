import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viswals_test/Core/Constants/Enums/DocumentTypes.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Widgets/AppButtonWidget.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/CancelButton.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

class SelectDocumentTypeDialog extends StatelessWidget {
  const SelectDocumentTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final quesProv = context.watch<QuestionsProvider>();
    return Dialog.fullscreen(
      backgroundColor: AppColors.black.withOpacity(0.8),
      child: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shrinkWrap: true,
                itemCount: DocumentType.values.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: AppButtonWidget(
                        fontWeight: FontWeight.w400,
                        buttonColorTheme: ButtonColorTheme.Black,
                        onPressed: () {
                          quesProv.setSelectedDocumentType(index);
                          context.pop();
                        },
                        btnName: DocumentType.values[index].string),
                  );
                }),
            const CancelButton(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
