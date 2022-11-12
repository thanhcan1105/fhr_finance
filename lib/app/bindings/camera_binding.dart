import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/camera_verify_controller.dart';

class CameraBinding implements Bindings{
  @override 
  void dependencies(){
    Get.put(CameraVerifyController());
  }
}