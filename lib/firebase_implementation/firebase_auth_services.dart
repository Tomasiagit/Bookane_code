import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<bool>authentication(String email, String password) async {
     try{
       UserCredential _userCredential =
       await _firebaseAuth.signInWithEmailAndPassword(
         email: email,
         password: password,
       );
       print(_userCredential);
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
}
