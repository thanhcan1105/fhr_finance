import 'package:get/get.dart';
import 'package:ykapay/app/controllers/info_user_controller.dart';

class InfoUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InfoUserController());
  }
}
