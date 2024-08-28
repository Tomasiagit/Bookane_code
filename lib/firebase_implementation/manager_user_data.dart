
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagerUSerData{
  static const String UID_KEY = 'uid';
  static const String EMAIL_KEY = 'email';


  Future<void> saveUserData(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(UID_KEY, user.uid);
    await prefs.setString(EMAIL_KEY, user.email ?? 'Email Desconhecido');
  }

  Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'uid': prefs.getString(UID_KEY),
      'email': prefs.getString(EMAIL_KEY),
    };
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString(UID_KEY);
    return uid != null;
  }
}