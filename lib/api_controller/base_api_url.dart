import 'package:http/http.dart' as http;

class BaseApiUrl {
   static const _baseApiUrl = 'http://192.168.1.102:8000/api';
  //static const _baseApiUrl = 'https://bookane.dreamgate.co.mz/public/api';

  //______________________User-Api_______________________//
  static const loginApiUrl = '$_baseApiUrl/login';
  static const cadastrarUserApiUrl = '$_baseApiUrl/users';
  static const visualizarUserApiUrl = '$_baseApiUrl/users';
 // static const apagarUserApiUrl = '$_baseApiUrl/users';
 // static const editarUserApiUrl = '$_baseApiUrl/users';
  static const dataUserApiUrl = '$_baseApiUrl/me';
  //_____________________Livro_Api______________________//
  static const mostrarLivrosApiUrl = '$_baseApiUrl/books';
//_____________________Classe_Api______________________//
//_____________________Disciplina_Api______________________//
//_____________________Pacote_Api______________________//
//_____________________Pagamentos_Api______________________//
  static const mostrarPacotesApiUrl = '$_baseApiUrl/pacotes';

}
