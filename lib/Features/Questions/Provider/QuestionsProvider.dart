import 'package:flutter/material.dart';
import 'package:viswals_test/Core/Constants/Enums/DocumentTypes.dart';
import 'package:viswals_test/Core/Constants/Question.dart';
import 'package:viswals_test/Core/SharedPreferences/shared_preferences.dart';
import 'package:viswals_test/Core/Utils/Debouncer.dart';
import 'package:viswals_test/Core/Utils/GraphUtils.dart';
import 'package:viswals_test/Features/Questions/Data/Models/CountryModel.dart';
import 'package:viswals_test/Features/Questions/Data/QuestionsLocalDataHandler.dart';
import 'package:viswals_test/Features/Questions/Data/QuestionsRepository.dart';

class QuestionsProvider extends ChangeNotifier {
  late QuestionsRepository _repository;
  late QuestionsLocalDataHandler _localDataHandler;

  QuestionsProvider(
      {required QuestionsRepository questionsRepository,
      required QuestionsLocalDataHandler localDataHandler}) {
    _repository = questionsRepository;
    _localDataHandler = localDataHandler;
    init();
  }

  // TextEditing controllers
  late TextEditingController numberController;
  late TextEditingController searchCountryController;

  // Document type
  DocumentType? selectedDocument;

  // Seletected country
  String? selectedCountry;

  //lsit of countries
  List<CountryModel> countriesList = [];
  List<CountryModel> searchCountriesList = [];
  //booleans
  bool isCompleted = false;
  double progressInPercentage = 0;

  //Questions
  List<Question> questions = [];
  late Question? selectedQuestion;
  double progressIndeicator = 0;

  // called when provider is initialized
  void init() async {
    numberController = TextEditingController();
    searchCountryController = TextEditingController();
    await UserPreference.initSharedPrefs();
    fetchDataFromLocal();
    getCountries();

    searchCountryController.addListener(() {
      Debouncer().run(() {
        searchCountries();
      });
    });

    numberController.addListener(() {
      Debouncer().run(() {
        notifyListeners();
      });
    });
  }

  /// Questions helper methods
  /// nextQues Goes to next question which is in sequence
  Future<void> nextQues() async {
    switch (selectedQuestion?.id) {
      case 0:
        selectedQuestion?.answer = selectedDocument!.name;
        break;

      case 1:
        selectedQuestion?.answer = numberController.text;
        break;

      case 2:
        selectedQuestion?.answer = selectedCountry!;

        break;

      default:
    }

    // get the index of selected question
    int index =
        questions.indexWhere((element) => element.id == selectedQuestion?.id);
    // replace the value at index in quetios with selctedQuestion
    questions[index] = selectedQuestion ?? questions.elementAt(index);
    // Store data on local
    await _localDataHandler.storeQuestions(questions);
    // increment to next question
    index++;
    // if index is in range than
    if (index <= questions.length - 1 &&
        questions.elementAt(index).answer.isNotEmpty) {
      // set selected question to the next question of current selected questions
      selectedQuestion = questions.elementAt(index);
      notifyListeners();
      return;
    }

    await fetchDataFromLocal();
    return;
  }

  /// goes to previous question which is in sequence
  void previousQuestion() {
    int position =
        questions.indexWhere((element) => element.id == selectedQuestion?.id);
    if (position > 0) position--;
    selectedQuestion = questions[position];
    notifyListeners();
  }

  /// Select Document helper methods
  /// Set the selected document based on the provided index
  void setSelectedDocumentType(int index) {
    selectedDocument = DocumentType.values[index];
    notifyListeners();
  }

  /// Button helper method
  /// Determine if the button should be enabled based on the current question
  bool isButtonEnabled() {
    switch (selectedQuestion?.id) {
      case 0:
        return selectedDocument != null;
      case 1:
        return numberController.text.isNotEmpty;
      case 2:
        return selectedCountry != null && selectedCountry != "";
      default:
        return false;
    }
  }

  // Countries helper methods
  Future<void> getCountries() async {
    countriesList = await _repository.getCountriesList();
    searchCountriesList = countriesList;
  }

  void searchCountries() {
    if (searchCountryController.text.isNotEmpty) {
      searchCountriesList = countriesList
          .where((element) =>
              (element.name ?? "").contains(searchCountryController.text))
          .toList();
    } else {
      searchCountriesList = countriesList;
    }
    notifyListeners();
  }

  void setSelectedCountry(int index) {
    selectedCountry = searchCountriesList[index].name;
    notifyListeners();
  }

  /// fetchDataFromLocal will fetch questions from local storage.
  /// A loop is run on all the questions and current questoin in set to the first question whose answer we get empty
  ///
  Future<void> fetchDataFromLocal() async {
    // getting questions if it is empty
    if (questions.isEmpty) {
      questions = await _localDataHandler.getQuestions();
    }

    // reseting the values
    selectedQuestion = null;
    isCompleted = false;
    int answers = 0;

    // looping on all the questions
    for (Question question in questions) {
      switch (question.id) {
        // select document question
        case 0:
          // if aleady answered then set the value
          if (question.answer.isNotEmpty) {
            if (question.answer == DocumentType.NationalCard.name) {
              selectedDocument = DocumentType.NationalCard;
            } else {
              selectedDocument = DocumentType.Passport;
            }
            answers++;
          } else {
            // set selected value to this question
            selectedQuestion ??= question;
          }

          break;

        case 1:
          if (question.answer.isNotEmpty) {
            numberController.text = question.answer;

            answers++;
          } else {
            selectedQuestion ??= question;
          }
          break;

        case 2:
          if (question.answer.isNotEmpty) {
            selectedCountry = question.answer;
            answers++;
          } else {
            selectedQuestion ??= question;
          }
          break;
      }
      progressInPercentage =
          GraphUtils.calculateProgressInPercentage(answeredQuestions: answers);
      progressIndeicator =
          GraphUtils.calculateIndicatorAngle(answeredQuestions: answers);
    }
    if (selectedQuestion == null) {
      isCompleted = true;
    }
    notifyListeners();
    return;
  }

  // resets all the value
  void resetTest() async {
    numberController.clear();
    searchCountryController.clear();
    selectedCountry = null;
    selectedDocument = null;
    progressInPercentage = 0;
    progressIndeicator = 0;
    UserPreference.clear();
    questions.clear();
    questions.addAll(Question.getQuestions());
    await _localDataHandler.storeQuestions(questions);
    fetchDataFromLocal();
  }
}
