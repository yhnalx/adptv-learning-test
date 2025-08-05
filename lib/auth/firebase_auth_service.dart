import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> checkCredential(String trim, {
  required String email,
  required String password,
  required Function(UserCredential) onSuccess,
  required Function(String) onError,
}) async {
  try {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    onSuccess(credential);
  } on FirebaseAuthException catch (e) {
    onError("FirebaseAuthException: ${e.message}");
  } catch (e) {
    onError("Exception: ${e.toString()}");
  }
}

  User? get currentUser => _auth.currentUser;

  bool get isLoggedIn => currentUser != null;

  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }


  Future<void> signOut() async {
    await _auth.signOut();
  }

 


}
