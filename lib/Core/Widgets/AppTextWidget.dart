import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget({
    Key? key,
    required this.txtTitle,
    this.txtColor = AppColors.textWhite,
    this.fontWeight = FontWeight.w400,
    this.fontStyle = FontStyle.normal,
    this.fontSize = 13,
    this.maxLine,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
    this.fontFamily,
  }) : super(key: key);

  final String txtTitle;
  final Color txtColor;
  final FontWeight fontWeight;

  // String fontFamily = AppTheme.robotoRegular,
  final FontStyle fontStyle;
  final double fontSize;
  final int? maxLine;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final TextDecoration decoration;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      txtTitle,
      maxLines: maxLine,
      style: TextStyle(
        color: txtColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize.sp,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
