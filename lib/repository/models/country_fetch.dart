import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryModel {
  static const String _baseUrl = 'https://restcountries.com/v3.1/all';

  Future<Map<String, dynamic>> fetchRandomCountry() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> countries = json.decode(response.body);
      countries.shuffle(); // Shuffle the list to get a random country
      return countries.first;
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
