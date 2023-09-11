import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Widgets/AppTextWidget.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget(
      {Key? key,
      this.height,
      this.width,
      required this.onPressed,
      required this.btnName,
      this.buttonColorTheme = ButtonColorTheme.Pink,
      this.fontSize = 13,
      this.fontWeight = FontWeight.bold,
      this.padding,
      this.borderColor,
      this.textColor,
      this.enabled = true})
      : super(key: key);
  final double? height;
  final double? width;
  final Function() onPressed;
  final String btnName;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets? padding;
  final ButtonColorTheme buttonColorTheme;
  final bool enabled;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      onTap: enabled ? onPressed : () {},
      child: Container(
          constraints: BoxConstraints(maxWidth: 374.w, minWidth: 177.w),
          height: height?.h,
          width: width?.w ?? double.infinity,
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: enabled
                ? buttonColorTheme.btnColors.btnColor
                : buttonColorTheme.btnColors.disableColor,
            border: Border.all(
                color: borderColor ?? buttonColorTheme.btnColors.borderColor,
                width: 1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: AppTextWidget(
            maxLine: 3,
            textAlign: TextAlign.center,
            txtTitle: btnName,
            fontSize: fontSize,
            txtColor: textColor ?? buttonColorTheme.btnColors.txtColor,
            fontWeight: fontWeight,
          )),
    );
  }
}

/// there are 3 types of button in design and based on each button a theme is created
/// 1. Pink
/// 2. White
/// 3. Grey
/// 4. Black
enum ButtonColorTheme {
  Pink(ButtonColorData(
      btnColor: AppColors.buttonPink,
      borderColor: AppColors.transparent,
      txtColor: AppColors.textWhite,
      disableColor: AppColors.disableButtonPink)),
  White(ButtonColorData(
      btnColor: AppColors.buttonWhite,
      borderColor: AppColors.transparent,
      txtColor: AppColors.blackText,
      disableColor: AppColors.buttonWhite)),
  Grey(ButtonColorData(
      btnColor: AppColors.buttonGrey,
      borderColor: AppColors.transparent,
      txtColor: AppColors.greyText,
      disableColor: AppColors.buttonGrey)),
  Black(ButtonColorData(
      btnColor: AppColors.buttonBlack,
      borderColor: AppColors.whiteBorder,
      txtColor: AppColors.white,
      disableColor: AppColors.buttonBlack));

  final ButtonColorData btnColors;
  const ButtonColorTheme(this.btnColors);
}

/// Button color data class
/// It holds all the different color which a button theme require
class ButtonColorData {
  final Color btnColor;
  final Color borderColor;
  final Color txtColor;
  final Color disableColor;
  const ButtonColorData(
      {required this.btnColor,
      required this.borderColor,
      required this.disableColor,
      required this.txtColor});
}
