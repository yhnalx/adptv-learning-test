import 'package:get/get.dart';
import 'package:app/auth/firebase_auth_service.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Inject FirebaseAuthService FIRST
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthService());

    // Then inject LoginController
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
