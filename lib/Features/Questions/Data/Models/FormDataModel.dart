/// FormDataModel is used to store and restore form data from local storage
class FormDataModel {
  String? country;
  String? number;
  String? documentType;
  int? questionsCompleted;
  FormDataModel({this.country, this.number, this.documentType,this.questionsCompleted});

  FormDataModel.fromJson(Map<String, dynamic> json) {
    FormDataModel(
        country: json["country"],
        documentType: json["documentType"],
        questionsCompleted: json["questionCompleted"]??0,
        number: json["number"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "documentType": documentType,
      "country": country,
      "number": number,
      "questionCompleted":questionsCompleted??0
    };
  }
}
