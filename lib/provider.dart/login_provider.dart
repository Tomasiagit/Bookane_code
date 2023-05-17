import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bookane/api_controller/base_api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  String? _token;
  final _headers = {
    HttpHeaders.acceptHeader: 'application/json',
  };

  Map<String, String> get _getHeaders {
    _headers.addAll({'Authorization': 'Bearer $_token'});
    return _headers;
  }

  Future<bool> loginFunction(String email, String password) async {
    var url = Uri.parse(BaseApiUrl.loginApiUrl);

    var response = await http.post(url,
        body: {
          'email': email,
          'password': password,
        },
        headers: _headers);

    if (response.statusCode == 200) {
      var dataUSer = jsonDecode(response.body);
      
      print('Response: ${response.body}');
      print('\n Data USER***$dataUSer');

      SharedPreferences prefs = await SharedPreferences.getInstance();
   
        
    var t = await prefs.setString("user", dataUSer['access_token']);
      notifyListeners();
      print('Response: Token:::::::: $t');

      return true;
    } else {
      print("something going wrong");
      return false;

      
    }
  }
}
