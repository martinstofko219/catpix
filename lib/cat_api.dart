import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './cat.dart';

class CatApi {
  final String _apiUrlRandomCat =
      'https://api.thecatapi.com/v1/images/search?format=src&size=full';

  Future<Cat> fetchRandomCat() async {
    final response = await http.get(_apiUrlRandomCat);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Cat.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load cat');
    }
  }
}
