import 'package:flutter/cupertino.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ykapay/app/services/auth_services.dart';
import 'package:ykapay/utils/notification_service.dart';

class LoginController extends GetxController with GetTool {
  // handle here
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isValidateUsername = false.obs;
  RxBool isValidatePassword = false.obs;
  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
  }

  formValidate() {
    if (isValidateUsername.value && isValidatePassword.value) {
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  handleLogin() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    if (isValidateUsername.value && isValidatePassword.value) {
      Map<String, String> data = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      var response = await AuthService().login(data: data);
      // print(response['user']);
      var deviceToken = PushNotificationsManager().init();
      
      if (response != null) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        box.write('token', response['token']);
        box.write('deviceToken', deviceToken);
        box.writeInMemory('accountMemory', emailController.text);
        Get.offAllNamed('bottom_menu');
        notify.success(message: 'Đăng nhập thành công!!', title: 'Thành công');
        isSubmitting.value = true;
      } else {
        Get.back();
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        notify.error(message: 'Đăng nhập thất bại!!', title: 'Thất bại');
      }
    }
  }
}
