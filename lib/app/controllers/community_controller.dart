import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CommunityController extends GetxController with GetTool {
  GetStorage box = GetStorage();
  RxInt isSelected = 0.obs;
}
