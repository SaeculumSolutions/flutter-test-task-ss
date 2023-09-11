import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viswals_test/Core/Constants/Enums/AppFontFamily.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Widgets/AppTextWidget.dart';

class FormFieldButton extends StatelessWidget {
  const FormFieldButton(
      {super.key,
      required this.hintText,
      this.value,
      required this.onPressed,
      this.showArrow = false});
  final String hintText;
  final String? value;
  final bool showArrow;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    bool hasValue = (value != null && (value?.isNotEmpty ?? false));
    return InkWell(
      onTap: onPressed,
      child: Container(
          constraints: BoxConstraints(maxWidth: 374.w),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: 16.w, vertical: hasValue ? 10.h : 14.h),
          decoration: BoxDecoration(
            color: hasValue ? AppColors.textFieldColor : AppColors.background,
            border: Border.all(color: AppColors.pinkBorder, width: 1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextWidget(
                      maxLine: 1,
                      fontFamily: AppFontFamily.Roboto.name,
                      txtTitle: hintText,
                      fontSize: hasValue ? 9 : 13,
                      txtColor: AppColors.grey,
                    ),
                    Visibility(
                      visible: hasValue,
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: AppTextWidget(
                          fontFamily: AppFontFamily.Roboto.name,
                          maxLine: 1,
                          txtTitle: value ?? "",
                          txtColor: AppColors.textWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: showArrow,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.grey,
                  size: 21.h,
                ),
              )
            ],
          )),
    );
  }
}
