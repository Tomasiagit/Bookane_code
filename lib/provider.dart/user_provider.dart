import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bookane/api_controller/base_api_url.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/profile.dart';

class UserProvider extends ChangeNotifier {
  String? _token;
  bool _isLoading = true;

  String? get token => _token;
  bool get isLoggedIn => _token != null && _token!.isNotEmpty;
  bool get isLoading => _isLoading;

  final _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final storedToken = prefs.getString('user_token');
    print("Token from SharedPreferences: $storedToken");
    _token = storedToken;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveLoginData(Map<String, dynamic> loginData) async {
    final prefs = await SharedPreferences.getInstance();
    final token = loginData['token'];
    final user = loginData['user'];

    final t = await prefs.setString('user_token', token);
    print("saved Token: $t");
    // Save user as JSON string

    final userJson = jsonEncode(user);
    print("saved userdata: $userJson");
    await prefs.setString('user_data', userJson);
    notifyListeners();

    print(" Token and user saved to SharedPreferences");
    print("Token: $token");
  }

  Future<bool>loginFunction(String email, String password) async {
    String? token;
    try {
      var url = Uri.parse(BaseApiUrl.loginApiUrl);
      var response = await http.post(url,
          body: jsonEncode({'email': email,'password': password}), headers: _headers);

      if (response.statusCode == 200) {
        var dataUSer = jsonDecode(response.body);
        await saveLoginData(dataUSer);
        //await prefs.setString('user_data', userJson);
        //print("UserData: $");

       //  print('Response: ${response.body}');
       //  print('\n Data USER***$dataUSer');
       //
       // final prefs = await SharedPreferences.getInstance();
       //  String userData = jsonEncode(user);
       //  if (token != null && token!.isNotEmpty) {
       //    await prefs.setString('user_data', user);
       //  }
       //  _token = token;
       //  notifyListeners();
       //  print('Token Response: $token');


        //var t = await prefs.setString("user", dataUSer['token']);


        return true;
      } else {
        print("something going wrong");
        return false;
      }
    }
    catch (e) {
      print("O Erro ao Logar: $e");
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
  print("O Erro Cadastrar: $e");
  return false;  // await prefs.remove('user_token');
    // _token = null;
    // notifyListeners();

  }
}



  Future<Profile>getProfile(String token) async {

    print("TOKEN:::$token");
    final prefs = await SharedPreferences.getInstance();
      try{
        var url = Uri.parse(BaseApiUrl.dataUserApiUrl);
        final response = await http.get(url, headers: {
          // 'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
        print("Token: $token");
        if (response.statusCode == 200) {
          print("RESPONSE:${response.body}");
          final datauser = prefs.getString('user_data');
          print('User data: $datauser');
          if(datauser != null){
            final dataUserMap = jsonDecode(datauser);
            return Profile.fromJson(dataUserMap);

          }else{
            print('No User found in sharedpresf');
            throw Exception('No User found in sharedpresf');
          }
          //final Map<String, dynamic> jsonData = jsonDecode(response.body);
        }else if(response.statusCode == 401){
          print("Exception: ${response.statusCode}");
          throw Exception('Por favor, faça Login');
          throw Exception('Erro  usuário: ${response.body}');
        } else {
          print("Exception: ${response.body}");
          throw Exception('Erro ao buscar usuário: ${response.body}');
        }

      }catch(e){
        print("Exception: $e");
        rethrow;
      }

  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    await prefs.remove('user_token');
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
