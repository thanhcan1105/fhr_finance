import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/forget_pass_controller.dart';
import 'package:ykapay/app/screens/login/components/input_code.dart';
import 'package:ykapay/utils/common.dart';
import '../../../../config/palette.dart';
import '../../../../utils/button_submit.dart';
import '../../../../utils/text_input.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  ForgetPassController controller = Get.put(ForgetPassController());
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
              left: 10,
              top: Get.height * .04,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  child: Icon(Icons.arrow_back),
                ),
              ),
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
                      "Quên mật khẩu",
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
                        controller.isValidateEmail.value = v;
                        controller.emailValidate();
                      },
                      rules: {
                        'email': true,
                        'required': 'Vui lòng nhập email',
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => MyButtonSubmit(
                        label: 'Gửi mã xác nhận'.tr.toUpperCase(),
                        onPressed: !controller.isEnableSubmit.value
                            ? null
                            : () {
                                // CommonWidget.progressIndicator();
                                controller.sentOTP();
                              },
                      ),
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
