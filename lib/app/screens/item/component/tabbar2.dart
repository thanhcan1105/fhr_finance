import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/item_controller.dart';
import 'package:ykapay/app/screens/my_step/my_step.dart';
import 'package:ykapay/utils/text_input.dart';

class Tabbar2 extends StatefulWidget {
  const Tabbar2({
    Key? key,
  }) : super(key: key);

  @override
  State<Tabbar2> createState() => _Tabbar2State();
}

class _Tabbar2State extends State<Tabbar2> {
  ItemController itemController = Get.put(ItemController());
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    ItemController controller = Get.put(ItemController());
    return SingleChildScrollView(
      child: Obx(
        () => MyStep(
          current: _currentStep,
          nextPress: () {
            itemController.handleSubmit();
          },
          isEnableSubmit: controller.isEnableSubmit.value,
          validatedStep: controller.validatedStep,
          listStep: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Text('Bước 1: Kiểm tra hồ sơ'.tr),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyTextInput(
                                title: 'Họ & tên',
                                isBorder: false,
                                iconData: null,
                                background: Colors.white,
                                hintColor: Colors.black,
                                controller: itemController.nameCustomerController,
                                validateCallback: (v) {
                                  itemController.isValidateName.value = v;
                                  itemController.formValidate();
                                },
                                rules: {
                                  'minLength': 6,
                                },
                                onTap: () {},
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Obx(
                              () => Transform.scale(
                                scale: 1.2,
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
                              width: Get.width * 0.01,
                            ),
                            Obx(
                              () => Transform.scale(
                                scale: 1.2,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyTextInput(
                                title: "CMND / CCCD",
                                textInputType: TextInputType.number,
                                isBorder: false,
                                iconData: null,
                                background: Colors.white,
                                hintColor: Colors.black,
                                controller: itemController.cccdCustomerController,
                                validateCallback: (v) {
                                  itemController.isValidateCCCD.value = v;
                                  itemController.formValidate();
                                },
                                rules: {'minLength': 9, 'maxLength': 13},
                                onTap: () {},
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MyTextInput(
                                title: 'Số điện thoại',
                                textInputType: TextInputType.number,
                                isBorder: false,
                                iconData: null,
                                background: Colors.white,
                                hintColor: Colors.black,
                                controller: itemController.phoneCustomerController,
                                validateCallback: (v) {
                                  itemController.isValidatePhone.value = v;
                                  itemController.formValidate();
                                },
                                rules: {
                                  'phone': true,
                                },
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        // Container(
                        //   width: Get.width,
                        //   height: 50,
                        //   child: TextFormField(
                        //     keyboardType: TextInputType.none,
                        //     decoration: InputDecoration(
                        //       // icon: Icon(Icons.location_on),
                        //       label: Text('Địa chỉ'),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextInput(
                          title: 'Địa chỉ',
                          hintText: 'Nhập địa chỉ',
                          isBorder: false,
                          iconData: null,
                          background: Colors.white,
                          hintColor: Colors.black,
                          controller: itemController.addressCustomerController,
                          validateCallback: (v) {
                            itemController.isValidateAddress.value = v;
                            itemController.formValidate();
                          },
                          rules: {},
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Text('Nhập kí tự tìm kiếm và chọn từ danh sách hiện ra')
                      ],
                    ),
                  ),
                ),
                CheckBox(),
              ],
            ),
            // Column(
            //   children: [
            //     Text('data1'),
            //   ],
            // ),
            // Column(
            //   children: [
            //     Text('data2'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CheckBox extends StatelessWidget {
  CheckBox({
    Key? key,
  }) : super(key: key);

  ItemController controller = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Obx(
            () => Transform.scale(
              scale: 1.5,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                    width: 1.0,
                    color: Colors.blue,
                  ),
                ),
                value: controller.isChecked.value,
                onChanged: (_) {
                  controller.check();
                  controller.formValidate();
                },
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Tôi đã đọc và đồng ý với các Điều khoản sử dụng và Chính sách bảo mật của .....',
              style: TextStyle(fontSize: 13),
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
