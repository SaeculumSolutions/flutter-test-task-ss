import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Widgets/AppTextWidget.dart';

/// common AppBar widget

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hideActions;
  final bool showBack;
  final Function()? onBack;
  const CommonAppBar(
      {super.key,
      this.onBack,
      required this.title,
      this.hideActions = false,
      this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: showBack,
        child: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
          onTap: () {
            if (onBack != null) {
              onBack!();
            }
            context.pop();
          },
        ),
      ),
      title: AppTextWidget(
        txtTitle: title,
        fontWeight: FontWeight.w900,
        txtColor: AppColors.textWhite,
      ),
      actions: hideActions
          ? []
          : [
              Padding(
                padding: EdgeInsets.only(right: 21.w),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: AppTextWidget(
                        txtTitle: "Skip",
                        txtColor: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.background,
      // Customize other AppBar properties here
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
