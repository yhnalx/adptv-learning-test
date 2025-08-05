import 'package:app/auth/firebase_auth_service.dart';
import 'package:app/bindings/splash_binding.dart';
import 'package:app/auth/firebase_options.dart';
import 'package:app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(new FirebaseAuthService());
  //Get.put(new FirestoreService());
  //Get.put(new FirebaseStorageService());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: SplashBinding(),
    initialRoute: Routes.SPLASH,
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}