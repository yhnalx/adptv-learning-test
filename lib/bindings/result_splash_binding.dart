import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/result_controller.dart';
import 'package:get/get.dart';

class ResultSplashBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<ResultSplashController> ( 
      () => ResultSplashController()
    );
  }
}