import 'package:get/get.dart';
import 'package:ykapay/app/controllers/collaborators_controller.dart';

class CollaboratorsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CollaboratorsController());
  }
}
