import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/screens/login/components/input_code.dart';
import 'package:ykapay/app/screens/login/components/new_pass.dart';
import 'package:ykapay/app/services/home_services.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';

class ForgetPassController extends GetxController with GetTool {
  TextEditingController emailController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reNewPasswordController = TextEditingController();

  TextEditingController tff1Controller = TextEditingController();
  TextEditingController tff2Controller = TextEditingController();
  TextEditingController tff3Controller = TextEditingController();
  TextEditingController tff4Controller = TextEditingController();
  TextEditingController tff5Controller = TextEditingController();
  TextEditingController tff6Controller = TextEditingController();

  RxBool isValidateEmail = false.obs;

  String submitedCode = '';

  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  emailValidate() {
    if (isValidateEmail.value) {
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  codeValidate() {
    if (tff1Controller.text.isNotEmpty && tff2Controller.text.isNotEmpty && tff3Controller.text.isNotEmpty && tff4Controller.text.isNotEmpty && tff5Controller.text.isNotEmpty && tff6Controller.text.isNotEmpty) {
      isEnableSubmit.value = true;
      return true;
    }
    isEnableSubmit.value = false;
    return false;
  }

  otp() {
    submitedCode = '';
    submitedCode += tff1Controller.text;
    submitedCode += tff2Controller.text;
    submitedCode += tff3Controller.text;
    submitedCode += tff4Controller.text;
    submitedCode += tff5Controller.text;
    submitedCode += tff6Controller.text;
    print(submitedCode);
  }

  sentOTP() async {
    if (true) {
      Map<String, String> data = {
        'email': emailController.text.trim(),
      };
      var response = await HomeService().sendOTP(data: data);
      Fluttertoast.showToast(msg: 'Mã xác nhận đã được gửi tới mail của bạn');
        Get.to(InputCode());
      if (response != null) {
        // Fluttertoast.showToast(msg: 'Mã xác nhận đã được gửi tới mail của bạn');
        // Get.to(InputCode());
      } else {
        Get.back();
        Fluttertoast.showToast(msg: 'Gửi lỗi, thử lại sau');
      }
    }
  }

  verifyOTP() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    if (true) {
      Map<String, String> data = {
        'code': submitedCode,
        'email': emailController.text.trim(),
        'new_password': newPasswordController.text.trim(),
      };
      print(data);
      var response = await HomeService().verifyOTP(data: data);
      if (response != null) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        Fluttertoast.showToast(msg: 'Đổi mật khẩu thành công');
        Get.toNamed('login');
        isSubmitting.value = true;
      } else {
        Fluttertoast.showToast(msg: 'Gửi lỗi, thử lại sau');
        isSubmitting.value = false;
        isEnableSubmit.value = true;
      }
    }
  }

  verifyCode() async {
    Map<String, String> data = {
      'code': submitedCode,
      'email': emailController.text.trim(),
    };
    var response = await HomeService().verifyCode(data: data);
    print(response['success']);
    if (response['success'] == true) {
      Get.to(NewPassword());
    } else {
      Fluttertoast.showToast(msg: 'Mã xác nhận không đúng');
    }
  }
}
