import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viswals_test/Core/Constants/Enums/AppFontFamily.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Widgets/AppTextFormField.dart';
import 'package:viswals_test/Core/Widgets/AppTextWidget.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/CancelButton.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

class SelectCountryDialog extends StatelessWidget {
  const SelectCountryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColors.black.withOpacity(0.8),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 16.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                decoration: BoxDecoration(
                    color: AppColors.buttonBlack,
                    borderRadius: BorderRadius.circular(20.r),
                    border:
                        Border.all(color: const Color(0xFF3A3A3C), width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: AppTextWidget(
                        txtTitle: "Country",
                        txtColor: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    25.verticalSpace,
                    AppTextFormField(
                      hintText: "Search",
                      borRadius: 5,
                      controller: context
                          .read<QuestionsProvider>()
                          .searchCountryController,
                      onChanged: (val) {},
                      borderColor: AppColors.primary,
                      hintTextColor: const Color(0xFFAEAEB2),
                      fillColor: AppColors.black,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 16.h, left: 16.w, right: 8.w, bottom: 16.h),
                        child: const Icon(
                          Icons.search,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    25.verticalSpace,
                    const AppTextWidget(
                      txtTitle: "Countries",
                      txtColor: AppColors.greyText,
                      fontWeight: FontWeight.w400,
                    ),
                    32.verticalSpace,
                    Expanded(
                      child: Consumer<QuestionsProvider>(
                          builder: (context, quesProvider, child) {
                        return ListView.builder(
                            itemCount: quesProvider.searchCountriesList.length,
                            padding: EdgeInsets.only(
                              right: 16.w,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  quesProvider.setSelectedCountry(index);
                                  context.pop();
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: AppTextWidget(
                                              fontFamily:
                                                  AppFontFamily.Roboto.name,
                                              txtColor: AppColors.grey,
                                              txtTitle: quesProvider
                                                      .searchCountriesList[
                                                          index]
                                                      .name ??
                                                  "N/A")),
                                      Visibility(
                                        visible: quesProvider
                                                .searchCountriesList[index]
                                                .name ==
                                            quesProvider.selectedCountry,
                                        child: Icon(
                                          Icons.flag_circle,
                                          size: 16.h,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }),
                    )
                  ],
                ),
              ),
            ),
            const CancelButton(),
            20.verticalSpace
          ],
        ),
      ),
    );
  }
}
