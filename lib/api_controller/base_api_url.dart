import 'package:http/http.dart' as http;

class BaseApiUrl {
  static const _baseApiUrl = 'http://192.168.1.102:8000/api';
   //static const _baseApiUrl = 'http://127.0.0.1:8000/api';
  //static const _baseApiUrl = 'https://bookane.dreamgate.co.mz/public/api';

  //______________________BookaneApi_______________________//
  static const loginApiUrl = '$_baseApiUrl/login';
  static const cadastrarUserApiUrl = '$_baseApiUrl/users';
  static const visualizarUserApiUrl = '$_baseApiUrl/users';
  static const dataUserApiUrl = '$_baseApiUrl/me';
  //_____________________LivroApi______________________//
  static const mostrarLivrosApiUrl = '$_baseApiUrl/books';
//_____________________ClasseApi______________________//
  static const mostrarCLassesApiUrl = '$_baseApiUrl/classes';
//_____________________DisciplinaApi______________________//
//_____________________PacoteApi______________________//
  static const mostrarPacotesApiUrl = '$_baseApiUrl/pacotes';
//_____________________PagamentosApi______________________//
  static const fazerPagamentoApiUrl = '$_baseApiUrl/pagamentos';
  static const verificarUserPagamentoApiUrl = '$_baseApiUrl/pagamentos/estado/';


}
