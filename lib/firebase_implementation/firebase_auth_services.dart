import 'package:bookane/firebase_implementation/manager_user_data.dart';
import 'package:bookane/models/user_model.dart';
import 'package:bookane/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;


  Future<bool>authentication(String email, String password) async {
     try{

       UserCredential _userCredential =
       await _firebaseAuth.signInWithEmailAndPassword(
         email: email,
         password: password,
       );
       User? user = _userCredential.user;

       print("USER: $user");
       if(user != null){
         ManagerUSerData managerUSerData = ManagerUSerData();
         managerUSerData.saveUserData(user);
         print('Bem Vindo ao BOOKANE ');
       //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bem Vindo ao BOOKANE')));
       }
       return true;
     }catch(e){
       print('Erro ao autenticar: $e');
       return false;
     }
  }

  Future<void> createUser(
      String displayName, String email, String password, String classe) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      print('Erro: ${e.message}');
      // Get.snackbar(
      //   "Falhou",
      //   "${e.message}",
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      //   colorText: const Color.fromARGB(255, 255, 255, 255),
      //   maxWidth: double.infinity,
      // );
    } catch (e) {
    print("error: $e");
    }
  }

  Future<void> registarUser(String nome, String email, String classe, String senha, BuildContext context)async {


    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
      User? user = userCredential.user;

      if(user != null){
        UserModel userModel = UserModel(
          uid: user.uid,
          nome: nome,
          email: user.email,
          classe: classe,
        );
        await db.collection('utilizador').doc(user.uid).set(userModel.toMap());
        print("Usuário registrado e dados adicionais salvos com sucesso!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),  // Substitua HomePage com a sua tela
        );
      }

    } on FirebaseAuthException catch (e) {
      print("Erro ao registrar o usuário: ${e.message}");
    }
    catch(e){
      print("Erro: $e");
    }
  }

  Future<UserModel?> getUserProfile(String? uid) async {
    try {

      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('utilizador')
          .doc(uid)
          .get();

      if (doc.exists) {

        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('user não encontrado');
        return null;
      }
    } catch (e) {
      print('Erro ao buscar dados do user: $e');
      return null;
    }
  }

}
