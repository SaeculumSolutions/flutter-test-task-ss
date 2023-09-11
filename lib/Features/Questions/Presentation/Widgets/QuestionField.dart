import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viswals_test/Core/Router/RouteName.dart';
import 'package:viswals_test/Core/Widgets/AppTextWidget.dart';
import 'package:viswals_test/Core/Widgets/FormFieldButton.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/QuestionsBottomButton.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/SelectCountryDialog.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/SelectDocumentTypeDialog.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

class QuestionField extends StatelessWidget {
  const QuestionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionsProvider>(builder: (context, quesProvider, child) {
      return Expanded(
        flex: 3,
        child: Column(
          children: [
            _RenderFieldBasedOnQues(quesProv: quesProvider),
            const Spacer(
              flex: 2,
            ),
            const QuestionsBottomButton(),
          ],
        ),
      );
    });
  }
}

class _RenderFieldBasedOnQues extends StatelessWidget {
  const _RenderFieldBasedOnQues({required this.quesProv});
  final QuestionsProvider quesProv;

  @override
  Widget build(BuildContext context) {
    switch (quesProv.selectedQuestion?.id) {
      case 0:
        return FormFieldButton(
          showArrow: true,
          hintText: "Type",
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const SelectDocumentTypeDialog());
          },
          value: quesProv.selectedDocument?.string,
        );
      case 1:
        return FormFieldButton(
          showArrow: false,
          hintText: "Number",
          onPressed: () {
            context.push(AppRouterName.enterNumberScreen);
          },
          value: quesProv.numberController.text,
        );
      case 2:
        return FormFieldButton(
          showArrow: true,
          hintText: "Country",
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const SelectCountryDialog();
                }).then((value) {
              quesProv.searchCountryController.clear();
            });
          },
          value: quesProv.selectedCountry,
        );
      default:
        return Center(
          child: AppTextWidget(txtTitle: quesProv.selectedQuestion?.question??''),
        );
    }
  }
}
