import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/login_controller.dart';
import 'package:ykapay/app/screens/login/components/forget_pass.dart';
import 'package:ykapay/app/screens/login/components/row_appbar.dart';
import 'package:ykapay/config/palette.dart';
import 'package:ykapay/utils/button_submit.dart';
import 'package:ykapay/utils/common.dart';
import 'package:ykapay/utils/text_input.dart';

class LoginScreen extends GetView<LoginController> {
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
              padding: EdgeInsets.only(top: Get.height * .15, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.15),
                    Text(
                      "${'login_sign_in'.tr}",
                      style: Palette.textTitle1(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextInput(
                      hintText: 'Email'.tr,
                      iconData: Icons.account_circle,
                      controller: controller.emailController,
                      validateCallback: (v) {
                        controller.isValidateUsername.value = v;
                        controller.formValidate();
                      },
                      rules: {
                        'minLength': 6,
                        'required': 'Vui lòng nhập email',
                        'email': true,
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
                        'required': 'login_please_enter_your_password'.tr,
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ForgetPassScreen());
                            },
                            child: Container(
                              child: Text(
                                'login_forget_pass'.tr,
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => MyButtonSubmit(
                        label: 'login_sign_in'.tr.toUpperCase(),
                        submiting: controller.isSubmitting.value,
                        onPressed: !controller.isEnableSubmit.value
                            ? null
                            : () {
                                CommonWidget.progressIndicator();
                                controller.handleLogin();
                                // controller.login();
                              },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('login_do_not_have_account'.tr),
                        InkWell(
                          onTap: () {
                            Get.toNamed('register');
                          },
                          child: Text(
                            "login_register".tr,
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
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
