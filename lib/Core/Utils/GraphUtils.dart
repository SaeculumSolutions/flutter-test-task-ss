import 'package:viswals_test/Core/Constants/Question.dart';

class GraphUtils {
  // Length of question will decide dynamic graph
  static double get questionsLength {
    return Question.getQuestions().length.toDouble();
  }

  static double calculateIndicatorAngle({required int answeredQuestions}) {
    double singleAngleValue = 360 / (questionsLength);
    double centerValue = singleAngleValue / 2;

    return (centerValue + (answeredQuestions * singleAngleValue));
  }

  static double calculateProgressInPercentage(
      {required int answeredQuestions}) {
    double eachItemConsumption = 100 / questionsLength;
    return eachItemConsumption * answeredQuestions;
  }
}
