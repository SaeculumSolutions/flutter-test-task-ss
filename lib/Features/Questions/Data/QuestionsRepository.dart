import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:viswals_test/Core/Constants/DotEnvKeys.dart';
import 'package:viswals_test/Core/Network/NetworkHandler.dart';
import 'package:viswals_test/Features/Questions/Data/Models/CountryModel.dart';

// Handles API response and converts them into data
class QuestionsRepository {
  late NetworkHandler _networkHandler;
  QuestionsRepository({required NetworkHandler networkHandler}) {
    _networkHandler = networkHandler;
  }

  /// getCountriesList fetches country from api and converts it into data class
  Future<List<CountryModel>> getCountriesList() async {
    List<CountryModel> result = [];
    final response = await _networkHandler.getMethod(
        url: dotenv.get(DotEnvKeys.countryUrl));
    if (response is List<dynamic>) {
      result = List<CountryModel>.generate(
          response.length, (index) => CountryModel.fromJson(response[index]));
    }
    result.sort((a, b) => (a.name ?? "").compareTo(b.name ?? ""));
    return result;
  }
}
