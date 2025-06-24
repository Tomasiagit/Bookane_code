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


}
