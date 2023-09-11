import 'dart:convert';
import 'package:viswals_test/Core/Constants/Question.dart';
import 'package:viswals_test/Core/SharedPreferences/PrefKeys.dart';
import 'package:viswals_test/Core/SharedPreferences/shared_preferences.dart';

class QuestionsLocalDataHandler {
  /// storeQuestions store the 
  Future<void> storeQuestions(List<Question> list) async{
    String json = jsonEncode(list.map((e) => e.toJson()).toList());
    await UserPreference.setValue(key: PrefKeys.formData, value: json);
    return;
  }

  /// getQuestions fetched questions from local 
  Future<List<Question>> getQuestions() async {
    var data = await UserPreference.getValue(key: PrefKeys.formData);
    if(data==null)
    {
        List<Question> questions =  Question.getQuestions();
        return questions;
    }
    return Question.dataFromJson(data);
  }

}