import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> authentication(String email, String password) async {
    UserCredential _userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print(_userCredential);
  }

  Future<void> createUser(
      String displayName, String email, String password) async {
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
    } catch (e) {}
  }
}
