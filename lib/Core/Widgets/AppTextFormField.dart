import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viswals_test/Core/Constants/Enums/AppFontFamily.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {Key? key,
      this.onChanged,
      required this.hintText,
      this.txtAlign,
      this.obscureText = false,
      this.suffixWidget,
      this.controller,
      this.focusNode,
      this.sideButton,
      this.validator,
      this.suffixStyle,
      this.suffixIcon,
      this.autoFocus = false,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.words,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.autoCorrect = false,
      this.isFilled,
      this.errorTxt,
      this.inputFormatters,
      this.keyboardType,
      this.fontSize = 13,
      this.fontWeight = FontWeight.w400,
      this.cursorColor = AppColors.primary,
      this.prefixIcon,
      this.borderColor = AppColors.pinkBorder,
      this.onTap,
      this.borderWidth = 1,
      this.borderStyle = BorderStyle.solid,
      this.readOnly = false,
      this.maxLength,
      this.contentPadding,
      this.onSaved,
      this.prefixWidget,
      this.borRadius,
      this.hintTextColor = AppColors.hintTextColor,
      this.initialValue,
      this.fillColor = AppColors.background,
      this.textColor = AppColors.textWhite})
      : super(key: key);

  final Function(dynamic val)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  final FormFieldSetter<String>? onSaved;
  final Function(String val)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign? txtAlign;
  final bool obscureText;
  final bool autoCorrect;
  final bool autoFocus;
  final bool? isFilled;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final String? errorTxt;
  final String? initialValue;
  final TextStyle? suffixStyle;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? sideButton;
  final String? Function(String?)? validator;
  final double fontSize;
  final int? maxLength;
  final FontWeight? fontWeight;
  final Color? cursorColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Color fillColor;
  final GestureTapCallback? onTap;
  final double borderWidth;
  final BorderStyle borderStyle;
  final bool readOnly;
  final Color textColor;
  final Color hintTextColor;
  final double? borRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      autofocus: autoFocus,
      // initialValue: initialValue!=null && initialValue!.isNotEmpty ?initialValue:"",
      onSaved: onSaved,
      onTap: onTap,

      maxLength: maxLength,
      style: TextStyle(
        color: textColor,
        fontFamily: AppFontFamily.Roboto.name,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      cursorColor: cursorColor,
      cursorWidth: 1.w,
      cursorHeight: fontSize.sp,
      decoration: InputDecoration(
        counterText: "",
        contentPadding: contentPadding ?? EdgeInsets.all(15.r),
        errorStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
        isDense: true,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        errorText: errorTxt,
        icon: sideButton,
        prefixIcon: prefixIcon,
        suffix: suffixWidget,
        suffixIcon: InkWell(
          onTap: () => controller?.clear(),
          child: suffixIcon ??
              Container(
                  margin: EdgeInsets.all(15.h),
                  padding: EdgeInsets.all(2.h),
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: Icon(
                    Icons.clear,
                    color: AppColors.background,
                    size: 15.h,
                  )),
        ),
        suffixStyle: suffixStyle,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: AppFontFamily.Roboto.name,
            color: hintTextColor,
            fontSize: fontSize.sp,
            fontWeight: fontWeight),
        fillColor: fillColor,
        border: _getOutlineBorder(),
        enabledBorder: _getOutlineBorder(),
        focusedBorder: _getOutlineBorder(),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      autocorrect: autoCorrect,
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }

  InputBorder _getOutlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borRadius?.r ?? 20.r),
        borderSide: BorderSide(
            style: borderStyle,
            color: borderColor ?? AppColors.black,
            width: borderWidth));
  }
}
