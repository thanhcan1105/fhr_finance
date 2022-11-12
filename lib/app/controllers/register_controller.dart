import 'package:flutter/material.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/services/auth_services.dart';
import 'package:ykapay/utils/common.dart';

class RegisterController extends GetxController with GetTool {
  // handle here
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNunberController = TextEditingController();
  TextEditingController cardIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  RxBool isValidateFullName = false.obs;
  RxBool isValidateEmail = false.obs;
  RxBool isValidatePassword = false.obs;
  RxBool isValidatePhoneNumber = false.obs;
  RxBool isValidateCardId = false.obs;
  RxBool isValidateRepassword = false.obs;
  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  RxString errorString = ''.obs;

  formValidate() {
    if (isValidateEmail.value && isValidatePassword.value && isValidatePhoneNumber.value && isValidateCardId.value && isValidateRepassword.value && isValidateFullName.value) {
      if (passwordController.text != rePasswordController.text) {
        errorString.value = 'login_confirm_password_wrong'.tr;
        return;
      } else {
        errorString.value = '';
      }
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  handleRegister() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    CommonWidget.progressIndicator();
    if (isValidateEmail.value && isValidatePhoneNumber.value && isValidateCardId.value && isValidatePassword.value && isValidateFullName.value) {
      Map<String, String> data = {
        'name': fullNameController.text,
        'email': emailController.text,
        'phone': phoneNunberController.text,
        'cccd': cardIdController.text,
        'password': passwordController.text,
        // 'repassword': rePasswordController.text,
      };
      var response = await AuthService().register(data: data);
      if (response != null) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        Get.back();
        Get.offAllNamed('login');
        notify.success(message: 'Đăng ký thành công!!', title: 'Thành công');
      } else {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        Get.back();
        notify.error(message: 'Đăng ký thất bại!!', title: 'Thất bại');
      }
    }
  }
}
