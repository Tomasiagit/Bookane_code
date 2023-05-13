import 'dart:convert';

import 'package:bookane/models/profile.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_controller/base_api_url.dart';

class ProfileProvider extends ChangeNotifier{

   Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tt = prefs.getString('access_token');

    return tt.toString();
    //return user['token'];
  }



 Future <Profile>getProfile() async {
    String? _token = await getToken();
   var url = Uri.parse(BaseApiUrl.infoEstudanteApiUrl);
      final response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'bearer $_token'
      });

      if (response.statusCode == 200) {
              print("RESPONSE:${response.body}");
        return Profile.fromJson(jsonDecode(response.body));
       
      } else {
    
         throw Exception('Failed to load album');
      }
    
  }
}