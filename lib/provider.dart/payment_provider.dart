import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_controller/base_api_url.dart';
import '../models/classe.dart';
import '../models/pacote.dart';

class PaymentsProvider extends ChangeNotifier{
  final _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  bool isLoggedIn = true;

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

  Future<List<Classe>> fetchClasses() async {
    var url = Uri.parse(BaseApiUrl.mostrarCLassesApiUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final List<dynamic> listClasses = data['classes'];

      return listClasses.map((json) => Classe.fromJson(json)).toList();

    } else {
      throw Exception('Erro ao buscar as classes');
    }
  }

  DateTime addMonths(DateTime date, int monthsToAdd) {
    int newYear = date.year + ((date.month + monthsToAdd - 1) ~/ 12);
    int newMonth = ((date.month + monthsToAdd - 1) % 12) + 1;

    // Garante que o dia não ultrapasse o último dia do novo mês
    int newDay = date.day;
    int lastDayOfNewMonth = DateTime(newYear, newMonth + 1, 0).day;
    if (newDay > lastDayOfNewMonth) newDay = lastDayOfNewMonth;

    return DateTime(newYear, newMonth, newDay);
  }

  String defineDate(int idClasse){
    DateTime dataActual = DateTime.now();
    DateTime dataFim;

    if(idClasse == 1){
      dataFim = addMonths(dataActual, 1);
      return dataFim.toString();
    }else if(idClasse ==2){
      dataFim = addMonths(dataActual, 3);
      return dataFim.toString();
    }else if(idClasse ==3){
      dataFim = addMonths(dataActual, 6);
      return dataFim.toString();
    }else{
      dataFim = addMonths(dataActual, 12);
      return dataFim.toString();
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');

    if (userData != null) {
      final Map<String, dynamic> userMap = jsonDecode(userData);
      print("Dados do usuário: $userMap");

     return userMap;
    }else{
     return null;
    }
  }

  Future<bool> createPayment(int pacoteID, int classeID) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');
    int userID = 0;

    if (userData != null) {
      final Map<String, dynamic> userMap = jsonDecode(userData);
      print("Dados do usuário: $userMap");

      userID = userMap['id'];
    }else{
      isLoggedIn = false;
      notifyListeners();
    }
    DateTime currentDate = DateTime.now();
    String dataInicio = currentDate.toString();
    String dataFim = defineDate(classeID);

    try {
      var url = Uri.parse(BaseApiUrl.fazerPagamentoApiUrl);
      var response = await http.post(url, body:jsonEncode( {
        'user_id': userID,
        'pacote_id': pacoteID,
        'classe_id': classeID,
        'estado': 'activo',
        'data_inicio': dataInicio,
        'data_fim': dataFim
      }), headers: _headers);

      if (response.statusCode == 200) {
        print('Pagameno Registado');
        return true;
      } else {
        print('Erro ao Pagar');
        return false;
      }
    }
    catch(e){
      print("O Erro criar Pagamento:: $e");
      return false;

    }
  }

  Future<Map<String, dynamic>?>VerifyPaymentUser() async {
    int userID = 0;
    final userMap = await getUserData();
    if (userMap != null && userMap.containsKey("id")) {
      userID = userMap["id"];
      print("User ID: $userID");
    } else {
      print("No user data or ID not found.");
    }

    try{
      var url = Uri.parse('${BaseApiUrl.verificarUserPagamentoApiUrl}$userID');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("User ID: $data");
        final prefs = await SharedPreferences.getInstance();
          if(data['status'] == true && data['pagamento'] !=null){
              return data["pagamento"];
          }else{
            print("Pagamento não encontrado ou status falso.");
            return null;
          }
      } else {
        print("Erro de conexão: ${response.statusCode}");
        return null;
      }

    } catch(e){
      print("Erro verificar pagamento: $e");
      return null;
    }

  }



}