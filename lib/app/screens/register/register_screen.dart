import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/register_controller.dart';
import 'package:ykapay/app/screens/login/components/row_appbar.dart';
import 'package:ykapay/config/palette.dart';
import 'package:ykapay/utils/button_submit.dart';
import 'package:ykapay/utils/text_input.dart';

const String CAPTCHA_SITE_KEY = "6LezvcoUAAAAAOLuRkLd12Vv07OVyqkLg3DfXzpk";

class RegisterScreen extends GetView<RegisterController> {
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: Get.size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: Get.size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: Get.size.width * 0.3,
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
            ),
            Positioned(
              right: 0,
              top: Get.height * .065,
              child: RowAppBar(),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * .25, left: 10, right: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      "${'login_sign_up'.tr}",
                      style: Palette.textTitle1(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextInput(
                      hintText: 'Email'.tr,
                      iconData: Icons.supervised_user_circle,
                      controller: controller.emailController,
                      validateCallback: (v) {
                        controller.isValidateEmail.value = v;
                        controller.formValidate();
                      },
                      rules: {
                        'minLength': 6,
                        'required': 'Email không được trống',
                        'email': true,
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextInput(
                      hintText: 'Ho & tên'.tr,
                      iconData: Icons.supervised_user_circle,
                      controller: controller.fullNameController,
                      validateCallback: (v) {
                        controller.isValidateFullName.value = v;
                        controller.formValidate();
                      },
                      rules: {
                        'minLength': 2,
                        'required': 'Họ & tên không được trống',
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextInput(
                      hintText: 'Số điện thoại'.tr,
                      iconData: Icons.supervised_user_circle,
                      controller: controller.phoneNunberController,
                      textInputType: TextInputType.number,
                      validateCallback: (v) {
                        controller.isValidatePhoneNumber.value = v;
                        controller.formValidate();
                      },
                      rules: {
                        'phone': true,
                        'required': 'Số điện thoại không được trống',
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextInput(
                      hintText: 'CMND / CCCD'.tr,
                      iconData: Icons.supervised_user_circle,
                      controller: controller.cardIdController,
                      textInputType: TextInputType.number,
                      validateCallback: (v) {
                        controller.isValidateCardId.value = v;
                        controller.formValidate();
                      },
                      rules: {
                        'minLength': 9,
                        'maxLength': 12,
                        'required': 'CMND / CCCD không được trống',
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextInput(
                      hintText: 'login_password'.tr,
                      iconData: Icons.lock,
                      controller: controller.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      validateCallback: (v) {
                        controller.isValidatePassword.value = v;
                        controller.formValidate();
                      },
                      rules: {
                        'minLength': 6,
                        'required': 'Vui lòng nhập mật khẩu',
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextInput(
                      hintText: 'login_repassword'.tr,
                      iconData: Icons.lock,
                      textInputType: TextInputType.visiblePassword,
                      controller: controller.rePasswordController,
                      validateCallback: (v) {
                        controller.isValidateRepassword.value = v;
                        controller.formValidate();
                      },
                      rules: {
                        'minLength': 6,
                        'required': 'Vui lòng nhập lại mật khẩu',
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() => Text(controller.errorString.value, style: Palette.textStyle().copyWith(color: Colors.red))),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => MyButtonSubmit(
                        label: 'Tiếp tục'.tr.toUpperCase(),
                        submiting: controller.isSubmitting.value,
                        onPressed: !controller.isEnableSubmit.value
                            ? null
                            : () {
                                controller.handleRegister();
                              },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Đã có tài khoản? '),
                        InkWell(
                          onTap: () {
                            Get.offAllNamed('login');
                          },
                          child: Text(
                            'Đăng nhập ngay',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
