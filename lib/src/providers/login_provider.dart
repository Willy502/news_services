import 'dart:convert';

import 'package:news/src/shared/preferences.dart';
import 'package:http/http.dart' as http;

class LoginProvider {
  String _apliKey = 'AIzaSyCFNEbKnouZAHt-FJLKiX-zRKqAz58FL6c';
  String _baseUrl = 'identitytoolkit.googleapis.com';
  final preferences = Preferences();

  Future<bool> createAccount({required String email, required String password}) async {
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key' : _apliKey
    });

    final resp = await http.post(url, body: <String, String> {
      'email' : email,
      'password' : password,
      'returnSecureToken' : 'true'
    });

    final decodedData = json.decode(resp.body);
    if (decodedData["error"] != null) {
      return false;
    }
    
    preferences.token = decodedData["idToken"];

    return true;

  }

}