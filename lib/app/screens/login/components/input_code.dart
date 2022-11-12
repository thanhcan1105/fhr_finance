import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiver/async.dart';
import 'package:ykapay/app/controllers/forget_pass_controller.dart';
import 'package:ykapay/app/screens/login/components/new_pass.dart';
import 'package:ykapay/utils/button_submit.dart';
import 'package:ykapay/utils/common.dart';

import '../../../../config/palette.dart';

class InputCode extends StatefulWidget {
  const InputCode({Key? key}) : super(key: key);

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  var focusIndex0 = FocusNode();
  var focusIndex1 = FocusNode();
  var focusIndex2 = FocusNode();
  var focusIndex3 = FocusNode();
  var focusIndex4 = FocusNode();
  var focusIndex5 = FocusNode();

  int _start = 60;
  int _current = 60;

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    ForgetPassController controller = Get.put(ForgetPassController());
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
                      "Mã xác nhận",
                      style: Palette.textTitle1(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: Get.width * .6,
                        alignment: Alignment.center,
                        child: Text(
                          'Vui lòng nhập mã xác nhận được gửi về email đăng kí của bạn.',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   height: 50,
                    //   width: Get.width,
                    //   alignment: Alignment.center,
                    //   child: Form(
                    //     child: ListView.builder(
                    //         shrinkWrap: true,
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: 6,
                    //         itemBuilder: (context, index) => Container(
                    //               height: 50,
                    //               width: 40,
                    //               margin: EdgeInsets.only(right: 10),
                    //               child: TextFormField(
                    //                 autofocus: index == 0 ? true : false,
                    //                 // enabled: index == 0 ? true : false,
                    //                 textInputAction: TextInputAction.next,
                    // controller: controller.tffController,
                    //                 inputFormatters: [
                    //                   LengthLimitingTextInputFormatter(1),
                    //                 ],
                    //                 keyboardType: TextInputType.number,
                    //                 textAlign: TextAlign.center,
                    //                 decoration: InputDecoration(),
                    //                 onChanged: (v) {
                    //                   index.(1) ? null : (v.isNotEmpty ? FocusScope.of(context).nextFocus() : FocusScope.of(context).previousFocus());
                    //                 },
                    //               ),
                    //             ),
                    //             ),
                    //   ),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            focusNode: focusIndex0,
                            autofocus: true,
                            // enabled: index == 0 ? true : false,
                            textInputAction: TextInputAction.next,
                            controller: controller.tff1Controller,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(),
                            onChanged: (v) {
                              v.isNotEmpty ? FocusScope.of(context).requestFocus(focusIndex1) : null;
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            focusNode: focusIndex1,
                            autofocus: true,
                            // enabled: index == 0 ? true : false,
                            textInputAction: TextInputAction.next,
                            controller: controller.tff2Controller,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(),
                            onTap: () {
                              // FocusScope.of(context).requestFocus(focusIndex0);
                            },
                            onChanged: (v) {
                              v.isNotEmpty ? FocusScope.of(context).requestFocus(focusIndex2) : FocusScope.of(context).requestFocus(focusIndex0);
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            focusNode: focusIndex2,
                            autofocus: true,
                            // enabled: index == 0 ? true : false,
                            textInputAction: TextInputAction.previous,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            controller: controller.tff3Controller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(),
                            onTap: () {
                              // FocusScope.of(context).requestFocus(focusIndex0);
                            },

                            onChanged: (v) {
                              v.isNotEmpty ? FocusScope.of(context).requestFocus(focusIndex3) : FocusScope.of(context).requestFocus(focusIndex1);
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            focusNode: focusIndex3,
                            autofocus: true,
                            // enabled: index == 0 ? true : false,
                            textInputAction: TextInputAction.next,
                            controller: controller.tff4Controller,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(),
                            onTap: () {
                              // FocusScope.of(context).requestFocus(focusIndex0);
                            },
                            onChanged: (v) {
                              v.isNotEmpty ? FocusScope.of(context).requestFocus(focusIndex4) : FocusScope.of(context).requestFocus(focusIndex2);
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            focusNode: focusIndex4,
                            autofocus: true,
                            // enabled: index == 0 ? true : false,
                            textInputAction: TextInputAction.next,
                            controller: controller.tff5Controller,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(),
                            onTap: () {
                              // FocusScope.of(context).requestFocus(focusIndex0);
                            },
                            onChanged: (v) {
                              v.isNotEmpty ? FocusScope.of(context).requestFocus(focusIndex5) : FocusScope.of(context).requestFocus(focusIndex3);
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            focusNode: focusIndex5,
                            autofocus: true,
                            // enabled: index == 0 ? true : false,
                            textInputAction: TextInputAction.next,
                            controller: controller.tff6Controller,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(),
                            onTap: () {
                              // FocusScope.of(context).requestFocus(focusIndex0);
                            },
                            onChanged: (v) {
                              v.isNotEmpty ? null : FocusScope.of(context).requestFocus(focusIndex4);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Chưa nhận được mã? '),
                          GestureDetector(
                            onTap: _current == 0
                                ? () {
                                    startTimer();
                                    controller.sentOTP();
                                  }
                                : null,
                            child: Text(
                              _current != 0 ? _current.toString() : 'Gửi lại',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => MyButtonSubmit(
                        width: Get.width * .5,
                        // onPressed: () {
                        //   controller.otp();
                        //   controller.verifyCode();
                        // },
                        // submiting: controller.isSubmitting.value,
                        onPressed: !controller.isEnableSubmit.value
                            ? null
                            : () {
                                controller.otp();
                                controller.verifyCode();
                              },
                        label: 'Tiếp tục',
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
