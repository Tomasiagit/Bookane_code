import 'package:http/http.dart' as http;

class BaseApiUrl {
  static const _baseApiUrl = 'http://10.200.219.12:8000/api';
   //static const _baseApiUrl = 'http://127.0.0.1:8000/api';
  //static const _baseApiUrl = 'https://bookane.dreamgate.co.mz/public/api';
  //http://10.200.219.12:8000/storage/capas/1saCh84tmgAu9RtNSWJgucp5YeEe4TNCWWy30BEr.jpg

  //______________________BookaneApi_______________________//
  static const loginApiUrl = '$_baseApiUrl/login';
  static const cadastrarUserApiUrl = '$_baseApiUrl/users';
  static const visualizarUserApiUrl = '$_baseApiUrl/users';
  static const dataUserApiUrl = '$_baseApiUrl/me';
  //_____________________LivroApi______________________//
  static const mostrarLivrosApiUrl = '$_baseApiUrl/books';
  static const listaDelivrosPorClasseUrl = '$_baseApiUrl/livros/classe/';
//_____________________ClasseApi______________________//
  static const mostrarCLassesApiUrl = '$_baseApiUrl/classes';
//_____________________DisciplinaApi______________________//
//_____________________PacoteApi______________________//
  static const mostrarPacotesApiUrl = '$_baseApiUrl/pacotes';
//_____________________PagamentosApi______________________//
  static const fazerPagamentoApiUrl = '$_baseApiUrl/pagamentos';
  static const verificarUserPagamentoApiUrl = '$_baseApiUrl/pagamentos/estado/';


}
