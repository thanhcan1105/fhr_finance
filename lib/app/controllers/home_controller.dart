import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ykapay/app/services/auth_services.dart';
import 'package:ykapay/state/global.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTool {
  GetStorage box = GetStorage();
  final advancedDrawerController = AdvancedDrawerController();
  RxBool isLoading = false.obs;
  RxString result = ''.obs;
  GlobalState globalState = Get.find();

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() async {
    isLoading.value = true;
    await getUser();
    isLoading.value = false;
    super.onInit();
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  getUser() async {
    isLoading.value = true;
    var res = await AuthService().getUser();
    globalState.user.value = res;
    isLoading.value = false;
  }
}
