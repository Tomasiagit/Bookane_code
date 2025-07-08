import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bookane/api_controller/base_api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/profile.dart';

class UserProvider extends ChangeNotifier {
  String? _token;
  String? get token => _token;
  bool get isLoggedIn => _token != null && _token!.isNotEmpty;

  final _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  // Future<void> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final tt = prefs.getString('user');
  //   print('User::: $tt');
  //   if (tt != null && tt.isNotEmpty) {
  //     _token = tt;
  //     notifyListeners();
  //   }}
  Future<void> loadToken()  async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }

  Future<bool>loginFunction(String email, String password) async {
    try {
      var url = Uri.parse(BaseApiUrl.loginApiUrl);
      var response = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: _headers);

      if (response.statusCode == 200) {
        var dataUSer = jsonDecode(response.body);

        print('Response: ${response.body}');
        print('\n Data USER***$dataUSer');

       final prefs = await SharedPreferences.getInstance();
        if (token != null && token!.isNotEmpty) {
          await prefs.setString('user', token!);
        }
        _token = token;


        var t = await prefs.setString("user", dataUSer['token']);
        notifyListeners();
        print('Response: Token:::::::: $t');

        return true;
      } else {
        print("something going wrong");
        return false;
      }
    }
    catch (e) {
      print("O Erro: $e");
    }
    return false;
  }


  Future<bool> cadastrarFunction(String name, String email,
      String password) async {
    try {
      var url = Uri.parse(BaseApiUrl.cadastrarUserApiUrl);
      var response = await http.post(url, body:jsonEncode( {
        'name': name,
        'email': email,
        'role_id': 2,
        'password': password,
        'password_confirmation': password
      }), headers: _headers);

      if (response.statusCode == 200) {
        print('registro feito');
        return true;
      } else {
        print('Erro ao registar');
        return false;
      }
    }
  catch(e){
  print("O Erro: $e");
  return false;

  }
}



  Future<Profile>getProfile() async {
    loadToken();
    print("TOKEN:::$token");
    if(token == null){
      throw Exception('Usuário não autenticado');
    }
    var url = Uri.parse(BaseApiUrl.dataUserApiUrl);
    final response = await http.get(url, headers: {
     // 'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print("Token: $token");
    if (response.statusCode == 200) {
      print("RESPONSE:${response.body}");
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      print("Failed to load Profile");
      throw Exception('Erro ao buscar usuário: ${response.body}');
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    _token = null;
    notifyListeners();
  }

// Future<void> _getUserData() async {
//   UserModel? _userdata = await _firebaseAuthService.getUserProfile(widget.uid);
//   setState(() {
//     _userModel = _userdata!;
//     isLoading = false;  // Para controlar o carregamento
//   });
// }


}
