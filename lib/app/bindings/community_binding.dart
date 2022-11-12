import 'package:get/get.dart';
import 'package:ykapay/app/controllers/community_controller.dart';

class CommunityBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CommunityController());
  }
}
