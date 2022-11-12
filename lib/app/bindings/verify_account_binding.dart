import 'package:get/get.dart';
import 'package:ykapay/app/controllers/verify_account_controller.dart';

class VerifyAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VerifyAccountController());
  }
}
