import 'package:get/get.dart';
import 'package:ykapay/app/controllers/accumulated_income_controller.dart';

class AccumulatedIncomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccumulatedIncomeController());
  }
}
