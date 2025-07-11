
import 'package:bookane/firebase_implementation/manager_user_data.dart';
import 'package:bookane/provider.dart/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../books_page.dart';

class CardClasse extends StatelessWidget {
  final String grade, ordinary;
  const CardClasse({super.key, required this.grade, required this.ordinary});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = PaymentsProvider();
    return InkWell(
      onTap: () async{
        //To do
       // bool success = await paymentProvider.VerifyPaymentUser(userID);
       //
       // if(success){
       //   Navigator.of(context).push(
       //     MaterialPageRoute(builder: (context) {
       //       return  BooksPage(
       //         grade: grade,
       //       );
       //     }),
       //   );
       // }else{
       //
       //   ScaffoldMessenger.of(context).showSnackBar(
       //     const SnackBar(
       //       content: Text("Por favor, pague uma subscrição"),
       //     ),
       //   );
       // }
       //


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
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
