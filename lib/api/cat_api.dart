import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/cat.dart';

class CatApi {
  final String _apiUrlRandomCat =
      'https://api.thecatapi.com/v1/images/search?format=json&mime_types=jpg,png&size=full&category_ids=5';

  Future<Cat> fetchRandomCat() async {
    final Map<String, String> headers = {'x-api-key': AppConfig.catApiKey};
    final response = await http.get(_apiUrlRandomCat, headers: headers);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      final List<dynamic> catsList = jsonDecode(response.body);
      return Cat.fromJson(catsList[0] as Map<String, dynamic>);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load cat');
    }
  }
}
