import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../api_controller/base_api_url.dart';
import '../models/pacote.dart';

class PaymentsProvider extends ChangeNotifier{


  Future<List<Pacote>> fetchPacotes() async {
    var url = Uri.parse(BaseApiUrl.mostrarPacotesApiUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final List<dynamic> listPacotes = data['pacotes'];

      return listPacotes.map((json) => Pacote.fromJson(json)).toList();

    } else {
      throw Exception('Erro ao buscar pacotes');
    }
  }
}