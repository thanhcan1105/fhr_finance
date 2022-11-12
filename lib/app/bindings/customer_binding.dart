import 'package:get/get.dart';
import 'package:ykapay/app/controllers/customer_controller.dart';

class CustomerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomerController());
  }
}
