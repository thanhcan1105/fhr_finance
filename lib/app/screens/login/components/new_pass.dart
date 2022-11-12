import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/forget_pass_controller.dart';
import 'package:ykapay/utils/text_input.dart';
import '../../../../config/palette.dart';
import '../../../../utils/button_submit.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                      "Đặt lại mật khẩu",
                      style: Palette.textTitle1(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextInput(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'Nhập mật khẩu mới'.tr,
                      controller: controller.newPasswordController,
                      iconData: Icons.account_circle,
                      validateCallback: (v) {},
                      rules: {
                        'minLength': 6,
                      },
                    ),
                    MyTextInput(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'Nhập lại mật khẩu'.tr,
                      iconData: Icons.account_circle,
                      validateCallback: (v) {},
                      rules: {
                        'minLength': 6,
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButtonSubmit(
                      onPressed: () {
                        controller.verifyOTP();
                      },
                      label: 'Tiếp tục',
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
