import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VerifyAccountController extends GetxController with GetTool {
  GetStorage box = GetStorage();

  RxBool isMale = true.obs;
  RxBool isFemale = false.obs;

  RxString fontCardId = ''.obs;
  RxString backsideCardId = ''.obs;

  void gender(){
    if(isFemale.value == true){
      isMale == false;
    } else if(isMale.value == true){
      isFemale == false;
    }
  }
}
