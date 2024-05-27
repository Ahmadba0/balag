import 'package:balag/core/function/fcm.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    super.onInit();
  }
}
