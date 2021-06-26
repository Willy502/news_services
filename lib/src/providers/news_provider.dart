import 'dart:convert';
import 'dart:io';

import 'package:mime_type/mime_type.dart';
import 'package:news/src/models/news_model.dart';
import 'package:news/src/shared/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class NewsProvider {
  String _baseUrl = "edutec-flutter-news-default-rtdb.firebaseio.com";
  String _cloudinaryBaseUrl = "api.cloudinary.com";
  String _cloudName = "dxqvfn6ft";
  String _uploadPreset = "aysmxhkr";
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

  Future<bool> updateNews({required NewsModel news}) async {
    final url = Uri.https(_baseUrl, '/news/${news.id}.json', {
      'auth' : _preferences.token
    });

    final resp = await http.put(url, body: newsModelToJson(news));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<List<NewsModel>> loadNews() async {
    final url = Uri.https(_baseUrl, '/news.json', {
      'auth' : _preferences.token
    });

    final resp = await http.get(url);

    final Map<String, dynamic>? decodedData = json.decode(resp.body);
    final List<NewsModel> news = [];

    if (decodedData == null) return [];
    if (decodedData['error'] != null) return [];

    decodedData.forEach((id, internalNews) {
      final newsTemp = NewsModel.fromJson(internalNews);
      newsTemp.id = id;
      news.add(newsTemp);
    });

    return news;
  }

  Future<String?> uploadPicture({required File image}) async {
      final url = Uri.https(_cloudinaryBaseUrl, '/v1_1/$_cloudName/image/upload', {
        'upload_preset' : _uploadPreset
      });

      final imageUploadRequest = await http.MultipartRequest('POST', url);
      final mimeType = mime(image.path)!.split("/");

      final file = await http.MultipartFile
      .fromPath('file', image.path, contentType: MediaType(mimeType[0], mimeType[1]));

      imageUploadRequest.files.add(file);

      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);

      if (resp.statusCode != 200 && resp.statusCode != 201) {
        print("Algo salió mal");
        print(resp.body);
        return null;
      }

      final responseData = json.decode(resp.body);
      return responseData["secure_url"];

  }

}