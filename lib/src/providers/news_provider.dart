import 'dart:convert';

import 'package:news/src/models/news_model.dart';
import 'package:news/src/shared/preferences.dart';
import 'package:http/http.dart' as http;

class NewsProvider {
  String _baseUrl = "edutec-flutter-news-default-rtdb.firebaseio.com";
  final _preferences = Preferences();

  Future<bool> createNews({required NewsModel news}) async {
    final url = Uri.https(_baseUrl, '/news.json', {
      'auth' : _preferences.token
    });

    final resp = await http.post(url, body: newsModelToJson(news));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

}