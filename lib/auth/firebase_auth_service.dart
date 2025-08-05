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


  /// ✅ Returns the current user
  User? get currentUser => _auth.currentUser;

  /// ✅ Is user logged in
  bool get isLoggedIn => currentUser != null;

  /// ✅ Sign in with email and password
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

  /// ✅ Register with email and password
  Future<UserCredential?> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// ✅ Send email verification
  Future<void> sendEmailVerification() async {
    if (currentUser != null && !currentUser!.emailVerified) {
      await currentUser!.sendEmailVerification();
    }
  }

  /// ✅ Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// ✅ Delete account
  Future<void> deleteAccount() async {
    if (currentUser != null) {
      await currentUser!.delete();
    }
  }

  /// ✅ Change password
  Future<void> changePassword(String newPassword) async {
    if (currentUser != null) {
      await currentUser!.updatePassword(newPassword);
    }
  }

  /// ✅ Reset password by email
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
