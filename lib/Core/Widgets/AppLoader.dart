import 'package:flutter/material.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key, this.bgColor}) : super(key: key);
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      color: bgColor ?? AppColors.grey.withOpacity(0.6),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
