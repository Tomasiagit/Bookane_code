import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/asymmetric/api.dart' as pointycastle;
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:flutter/foundation.dart';

/// Page business logic validation
/// If validation fails, return error message; otherwise, return null.
///
class MpesaApi {

// Map<String, dynamic>?
  Future<bool> mpesaApiFuction(int valor, String telefone) async {
    // Token generation
    final String apiKey = "sx24dvj1kr1djzsoijuwglir0us7mxbc";
    final String publicKey = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAmptSWqV7cGUUJJhUBxsMLonux24u+FoTlrb+4Kgc6092JIszmI1QUoMohaDDXSVueXx6IXwYGsjjWY32HGXj1iQhkALXfObJ4DqXn5h6E8y5/xQYNAyd5bpN5Z8r892B6toGzZQVB7qtebH4apDjmvTi5FGZVjVYxalyyQkj4uQbbRQjgCkubSi45Xl4CGtLqZztsKssWz3mcKncgTnq3DHGYYEYiKq0xIj100LGbnvNz20Sgqmw/cH+Bua4GJsWYLEqf/h/yiMgiBbxFxsnwZl0im5vXDlwKPw+QnO2fscDhxZFAwV06bgG0oEoWm9FnjMsfvwm0rUNYFlZ+TOtCEhmhtFp+Tsx9jPCuOd5h2emGdSKD8A6jtwhNa7oQ8RtLEEqwAn44orENa1ibOkxMiiiFpmmJkwgZPOG/zMCjXIrrhDWTDUOZaPx/lEQoInJoE2i43VN/HTGCCw8dKQAwg0jsEXau5ixD0GUothqvuX3B9taoeoFAIvUPEq35YulprMM7ThdKodSHvhnwKG82dCsodRwY428kg2xM/UjiTENog4B6zzZfPhMxFlOSFX4MnrqkAS+8Jamhy1GgoHkEMrsT5+/ofjCx0HjKbT5NuA2V/lmzgJLl3jIERadLzuTYnKGWxVJcGLkWXlEPYLbiaKzbJb2sYxt+Kt5OxQqC1MCAwEAAQ==";
    // Criação da chave pública PEM formatada
    final String key = "-----BEGIN PUBLIC KEY-----\n" +
        publicKey +
        "\n-----END PUBLIC KEY-----";

    final rsaParser = RSAKeyParser();
    //final rsaPublicKey = rsaParser.parse(key);
    final rsaPublicKey = rsaParser.parse(key) as pointycastle.RSAPublicKey;

    //final encrypter = Encrypter(RSA(publicKey: rsaPublicKey));
    final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: rsaPublicKey));
    final encrypted = encrypter.encrypt(apiKey);
    final String token = base64Encode(encrypted.bytes);

    // Request payment
    final String endpoint = 'https://api.sandbox.vm.co.mz:18352/ipg/v1x/c2bPayment/singleStage/';
    final String mpesaToken = token;
    final String host = 'api.sandbox.vm.co.mz';
    final String shortCode = '171717'; // Trocar pelo código produção

    final headers = {
      'Host': host,
      'Origin': '*',
      'Authorization': 'Bearer $mpesaToken',
      'Content-Type': 'application/json',
    };

    // Supondo que você tenha uma função para buscar o pacote


    final String characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final String thirdPartyReference = String.fromCharCodes(
      List.generate(10, (_) =>
          characters.codeUnitAt(Random().nextInt(characters.length))),
    );

    final data = {
      'input_ThirdPartyReference': thirdPartyReference,
      // Referência string aleatória
      'input_Amount': "$valor",
      // Montante
      'input_CustomerMSISDN': "258$telefone",
      // Contacto
      'input_ServiceProviderCode': shortCode,
      // Código da empresa
      'input_TransactionReference': 'OEUT075411',
    };

    final jsonData = json.encode(data);

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == 200 || response.statusCode == 201 ) {
        final responseBody = json.decode(response.body);

        if (responseBody["output_ResponseDesc"] ==
            "Request processed successfully") {
          return true;
        } else {
          return false;
          // return {
          //   'response': responseBody,
          //   'status_code': response.statusCode,
          // };
        }
        return true;
      } else {
        print("statos Mpesa: ${response.statusCode}");
       // throw Exception('Failed to process request. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }
}