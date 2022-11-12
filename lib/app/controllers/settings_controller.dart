import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/user_model.dart';
import '../../state/global.dart';

class SettingsController extends GetxController with GetTool {
  GetStorage box = GetStorage();

  Rx<UserModel> user = Get.find<GlobalState>().user;

  @override
  void onInit() async {
    super.onInit();
  }
}
