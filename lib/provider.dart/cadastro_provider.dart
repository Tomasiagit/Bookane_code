import 'dart:io';

import 'package:bookane/api_controller/base_api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CadastrarProvider extends ChangeNotifier {
  String? _token;

  final _headers = {
    HttpHeaders.acceptHeader: 'application/json',
    //'Content-Type': 'application/json'
  };

  Future<bool> cadastrarFunction(
      String name, String email, String classe, String password) async {
    var url = Uri.parse(BaseApiUrl.cadastrarApiUrl);

    var response = await http.post(url, body: {
      'full_name': name,
      'email': email,
      'class_id': classe,
      'password': password,
    });

    if (response.statusCode == 200) {
      print('registro feito');
      return true;
    } else {
      print('registro buggou');
      return false;
    }
  }
}
