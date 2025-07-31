import 'package:bookane/provider.dart/mpesa_api.dart';
import 'package:bookane/provider.dart/payment_provider.dart';
import 'package:bookane/views/overview_page.dart';
import 'package:bookane/views/profile_page.dart';
import 'package:flutter/material.dart';

class FormPagamento extends StatefulWidget {
  final String duracao;
  final int valor;
  final int pacoteid;
  final int classeid;
  const FormPagamento({Key? key,  required this.duracao, required this.valor, required this.pacoteid, required this.classeid}) : super(key: key);

  @override
  State<FormPagamento> createState() => _FormPagamentoState();
}

class _FormPagamentoState extends State<FormPagamento> {
  final _keyform = GlobalKey<FormState>();
  final _telefoneController = TextEditingController();
  final MpesaApi _mpesaApi = MpesaApi();
  final payProvider = PaymentsProvider();
  bool inLoading = false;
  var valor = 100;
  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C60A0),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text('Pagamento',
          style: TextStyle(
              color:Color(0xFFFFFFFF)
          ),),
      ),
      body:  Stack(
        children: [
          Center(
            child: Form(
            key: _keyform ,
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [

                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Pagar com Mpesa',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF0C60A0),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      'Valor: ${widget.valor} mts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      )),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Informe o seu número Mpesa para pagar a sua subscrição.',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                    //   style: TextStyle(
                    //       color: Color(0xFF0C60A0),
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                          primary: const Color(0xFF0C60A0),
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _telefoneController,
                        validator: (telefone) {
                          if (telefone == null || telefone.isEmpty) {
                            return 'por favor, digite o seu de número de telefone';
                          } else if (_telefoneController.text.length != 9) {
                            return 'número inválido';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          ),
                          labelText: 'telefone',
                          prefixIcon: Icon(
                            Icons.call,
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            // height: 50,
                            width: widthSize <= 500 ? widthSize : 400,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_keyform.currentState!.validate()) {

                                    try{
                                      bool success = await _mpesaApi.mpesaApiFuction(
                                        widget.valor,
                                        _telefoneController.text.toString(),
                                      );
                                      print("Mpesa API returned: $success");

                                      if(success){

                                      //To do
                                    await payProvider.createPayment(widget.pacoteid, widget.classeid);
                                    // if(mpess){

                                    //
                                    // }
                                        print("Create payment Pass");
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   const SnackBar(
                                        //     content: Text("Pagamento com sucesso"),
                                        //   ),
                                        // );
                                        //To do fater pagameno sucesso
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OverViewPage(classe: "10-classe"))
                                    );


                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text("Falha no Pagamento."),
                                          ),
                                        );
                                      }
                                    }catch(e){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Erro ao autenticar: $e"),
                                        ),
                                      );
                                    }

                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0C60A0),
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  'Pagar',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 10),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          )
        ]
      ),
      resizeToAvoidBottomInset: false,

    );
  }
}
