import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:ykapay/main.dart';

class CameraVerifyController extends GetxController {
  late CameraController cameraController;
  // late List<CameraDescription> _cameras;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;

    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    cameraController.initialize().then((_) {}).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    cameraController.dispose();
  }
}
