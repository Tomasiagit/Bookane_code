import 'package:http/http.dart' as http;

class BaseApiUrl {
  // static const _baseApiUrl = 'http://bookane.marinoricardo.com/public/api';
  static const _baseApiUrl = 'https://bookane.dreamgate.co.mz/public/api';

  static const loginApiUrl = '$_baseApiUrl/auth/login';
  static const cadastrarApiUrl = '$_baseApiUrl/users';
  static const mostrarLivrosApiUrl = '$_baseApiUrl/books';
  static const infoEstudanteApiUrl = '$_baseApiUrl/auth/me';
}
