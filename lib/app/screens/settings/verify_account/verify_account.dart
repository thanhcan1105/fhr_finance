import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/verify_account_controller.dart';
import 'package:ykapay/app/screens/camera/camera.dart';
import 'package:ykapay/app/screens/camera/camera1.dart';
import 'package:ykapay/app/screens/my_step/my_step.dart';
import 'package:ykapay/utils/color.dart';

class VerifyAccountScreen extends GetView<VerifyAccountController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorFormat.BGColors,
        appBar: AppBar(
          backgroundColor: ColorFormat.BGColors,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Định danh tài khoản',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: MyStep(
            listStep: [
              //Info
              Item(
                title: 'Định danh tài khooản',
                list: [
                  Row(
                    children: [
                      Text('Giới tính *'),
                      Obx(
                        () => Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            value: controller.isMale.value,
                            onChanged: (_) {
                              controller.isMale.value = true;
                              controller.isFemale.value = false;
                            },
                          ),
                        ),
                      ),
                      Text('Nam'),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            value: controller.isFemale.value,
                            onChanged: (_) {
                              controller.isFemale.value = true;
                              controller.isMale.value = false;
                            },
                          ),
                        ),
                      ),
                      Text('Nữ'),
                    ],
                  ),
                  Container(
                    width: Get.width,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Email *'),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Quận/Huyện - Tỉnh/Thành phố *'),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Địa chỉ liên hệ *'),
                      ),
                    ),
                  ),
                ],
              ),
              //Email verify
              Item(
                title: 'Xác thực Email',
                list: [],
              ),
              //Take a pickture card id
              Item(
                title: 'Chụp hình CMND / CCCD',
                list: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hình chụp mặt trước CMND / CCCD'),
                      Text(
                        'Xem mẫu',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(CameraScreen());
                    },
                    child: Obx(
                      () => controller.fontCardId.isNotEmpty
                          ? Container(
                              height: Get.height * 0.13,
                              width: Get.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AspectRatio(
                                aspectRatio: Get.height / Get.width,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.center,
                                      image: FileImage(
                                          File(controller.fontCardId.value)),
                                      // Image.file(File(controller.fontCardId.value)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : DottedBorder(
                              radius: Radius.circular(10),
                              color: Colors.grey,
                              borderType: BorderType.RRect,
                              child: Container(
                                height: Get.height * 0.13,
                                width: Get.width * 0.4,
                                alignment: Alignment.center,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(10),
                                // ),
                                child: Image.asset(
                                  'assets/app_icons/font_card_id.png',
                                  height: Get.height * 0.05,
                                ),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hình chụp mặt sau CMND / CCCD'),
                      Text(
                        'Xem mẫu',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(CameraApp());
                    },
                    child: Obx(
                      () => controller.backsideCardId.isNotEmpty
                          ? Container(
                              height: Get.height * 0.13,
                              width: Get.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AspectRatio(
                                aspectRatio: Get.height / Get.width,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.center,
                                      image: FileImage(File(
                                          controller.backsideCardId.value)),
                                      // Image.file(File(controller.backsideCardId.value)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : DottedBorder(
                              radius: Radius.circular(10),
                              color: Colors.grey,
                              borderType: BorderType.RRect,
                              child: Container(
                                height: Get.height * 0.13,
                                width: Get.width * 0.4,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/app_icons/backside_card_id.png',
                                  height: Get.height * 0.05,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              //...
              Item(
                title: 'Hợp đồng dịnh vụ',
                list: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.list,
    required this.title,
  }) : super(key: key);

  final List<Widget> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 30),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.4,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Text(
                '- - o - -',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Container(
                width: Get.width * 0.4,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          ...list.map((e) => e),
        ],
      ),
    );
  }
}
