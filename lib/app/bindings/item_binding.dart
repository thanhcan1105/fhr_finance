import 'package:get/get.dart';
import 'package:ykapay/app/controllers/item_controller.dart';

class ItemBinding implements Bindings{
  @override
  void dependencies (){
    Get.put(ItemController());
  }
}