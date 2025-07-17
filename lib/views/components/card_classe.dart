
import 'package:bookane/firebase_implementation/manager_user_data.dart';
import 'package:bookane/provider.dart/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../books_page.dart';

class CardClasse extends StatelessWidget {
 // final String grade, ordinary;
 // final int iduser, idClasse;

  const CardClasse({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = PaymentsProvider();

    return InkWell(
      onTap: () async{
       final pagamento = await paymentProvider.VerifyPaymentUser();

       if (pagamento != null) {
         // print("Pagamento ativo: ${pagamento["estado"]}");
         // print("Pacote: ${pagamento["pacote_id"]}");
         // print("Data de Início: ${pagamento["data_inicio"]}");

         if(pagamento != null && pagamento["estado"] == "activo"){


           Navigator.of(context).push(
             MaterialPageRoute(builder: (context) {
               return  BooksPage(

                 classe: pagamento["classe"],
               );
             }),
           );
         }
       } else {
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
            // Text(
            // //  ordinary,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 18,
            //     // fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Classe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
