
import 'package:bookane/firebase_implementation/manager_user_data.dart';
import 'package:bookane/provider.dart/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../books_page.dart';

class CardClasse extends StatelessWidget {
  final String cls, ordinary;
 //final int iduser, idClasse;

  const CardClasse({super.key, required this.cls, required this.ordinary });

  @override
  Widget build(BuildContext context) {
    final paymentProvider = PaymentsProvider();
    String clas = cls ;

    return InkWell(
      onTap: () async{
       final pagamento = await paymentProvider.VerifyPaymentUser();

       if (pagamento != null) {


         if(pagamento["estado"] != "activo" || pagamento["classe"] != clas ){

             print("Nenhum pagamento encontrado.");
             ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(
                 content: Text("Não tem subscricão activa para está classe."),
               ),
             );

           }
         else{
             int IDclasse = pagamento["classe_id"];
             String classe = pagamento["classe"];
             print("A classe: $classe e o id: $IDclasse");
             Navigator.of(context).push(
               MaterialPageRoute(builder: (context) {
                 return  BooksPage(
                   classe: classe, classe_id: IDclasse,
                 );
               }),
             );
           }
         }
        else {
         print("Nenhum pagamento encontrado.");
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text("Por favor, pague ou atualize a subscrição"),
           ),
         );
       }





        // ManagerUSerData _managerUserData = ManagerUSerData();
        // bool userAlreadyLoggedIn = await _managerUserData.isUserLoggedIn();
        //
        // if(!userAlreadyLoggedIn){
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text("Faça login para continuar"),
        //     ),
        //   );
        // }else{
        //   Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) {
        //       return  BooksPage(
        //         grade: grade,
        //       );
        //     }),
        //   );
        // }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.black,
        ),
        child: Column(
          children:  [
            Text(
              ordinary,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Classe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                 fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
