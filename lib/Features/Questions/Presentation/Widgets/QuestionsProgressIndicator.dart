import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Core/Utils/GraphUtils.dart';
import 'package:viswals_test/Features/Questions/Presentation/Widgets/CircularIndicator.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

class QuestionsprogressIndicator extends StatelessWidget {
  const QuestionsprogressIndicator({super.key, this.showIndicator = true});
  final bool showIndicator;
  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionsProvider>(builder: (context, quesProvider, _) {
      double radiusFactor = 1;
      return LayoutBuilder(builder: (context, constraints) {
        return Container(
          constraints: const BoxConstraints(
            maxHeight: 205,
            maxWidth: 205,
          ),
          alignment: Alignment.center,
          height: constraints.maxWidth,
          width: constraints.maxWidth,
          child: Stack(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    maxHeight: 205 - 20,
                    maxWidth: 205 - 20,
                  ),
                  height: constraints.maxWidth - 20,
                  width: constraints.maxWidth - 20,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      // Create primary radial axis
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        radiusFactor: radiusFactor,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 0.1,
                          color: Color(0xFF333333),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: quesProvider.progressInPercentage,
                            color: AppColors.primary,
                            width: 0.1,
                            // pointerOffset: 0.07,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                      ),
                      // Create secondary radial axis for segmented line
                      RadialAxis(
                        minimum: 0,
                        interval: 1,
                        // provder approach
                        /* maximum: quesProvider.questions.isEmpty
                        //     ? 1
                             : quesProvider.questions.length.toDouble(),*/

                        // Graph utils approach
                        maximum: GraphUtils.questionsLength,
                        showLabels: false,
                        showTicks: true,
                        showAxisLine: false,
                        offsetUnit: GaugeSizeUnit.factor,
                        minorTicksPerInterval: 0,
                        startAngle: 270,
                        endAngle: 270,
                        radiusFactor: radiusFactor,
                        majorTickStyle: const MajorTickStyle(
                            length: 0.1,
                            thickness: 3.5,
                            lengthUnit: GaugeSizeUnit.factor,
                            color: AppColors.background),
                      ),
                      // inner circle chart
                      RadialAxis(
                          radiusFactor: radiusFactor - 0.04,
                          minimum: 0,
                          maximum: 100,
                          showLabels: false,
                          showTicks: false,
                          startAngle: 270,
                          endAngle: 270,
                          axisLineStyle: const AxisLineStyle(
                            thickness: 1,
                            color: Colors.transparent,
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            const RangePointer(
                              value: 100, // keep it at 100 to fill all space
                              width: 0.2,
                              color: Color(0xff6E6E73),
                              pointerOffset: 0.1,
                              cornerStyle: CornerStyle.bothFlat,
                              sizeUnit: GaugeSizeUnit.factor,
                            ),
                            RangePointer(
                              value: quesProvider.progressInPercentage,
                              width: 0.2,
                              color: AppColors.primary,
                              pointerOffset: 0.1,
                              cornerStyle:
                                  quesProvider.progressInPercentage >= 1
                                      ? CornerStyle.bothFlat
                                      : CornerStyle.bothCurve,
                              sizeUnit: GaugeSizeUnit.factor,
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${(quesProvider.progressInPercentage).round().toString()}%",
                  style: TextStyle(
                      fontSize: min(32, 32.sp),
                      fontWeight: FontWeight.w900,
                      color: AppColors.textWhite),
                ),
              ),
              Center(
                child: Visibility(
                    visible: showIndicator,
                    child: CircularIndicator(
                      angle: quesProvider.progressIndeicator,
                      width: constraints.maxWidth,
                    )),
              )
            ],
          ),
        );
      });
    });
  }
}
