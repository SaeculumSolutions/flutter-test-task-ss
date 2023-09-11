import 'dart:convert';

class Question {
  int? id;
  String? question;
  late String answer;

  Question(this.id, this.question, this.answer);

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }

  static List<Question> getQuestions() {
    List<Question> list = [];
    list.add(Question(0, "Document", ""));
    list.add(Question(1, "Number", ""));
    list.add(Question(2, "Country", ""));
    //Remove this comment to test dynamic graph and idicator
    // list.add(Question(3, "Gender", ""));
    return list;
  }

  static List<Question> dataFromJson(String str) {
    final jsonData = json.decode(str);
    return List<Question>.from(jsonData.map((x) => Question.fromJson(x)));
  }
}
