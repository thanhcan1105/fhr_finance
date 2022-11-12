import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ykapay/app/controllers/collaborators_controller.dart';
import 'package:ykapay/utils/color.dart';

// ignore: must_be_immutable
class CollaboratorsScreen extends GetView {
  CollaboratorsController controller = Get.put(CollaboratorsController());
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFormat.BGColors,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: Get.height + 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: Get.width,
                      height: 40,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Text(
                            'Quy định sở hữu cộng tác (CTV)',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment(0, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                ),
                                child: Icon(Icons.keyboard_arrow_left),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Tháng hiện tại',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                alignment: Alignment(0, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                ),
                                child: Icon(Icons.keyboard_arrow_right),
                              ),
                              Spacer(),
                              Text('Thông tin'),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 20,
                                width: 20,
                                alignment: Alignment(0, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blue),
                                ),
                                child: Text(
                                  '!',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text('Hoa hồng đã nhận'),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.euro,
                                          color: Colors.blue,
                                        ),
                                        Text('0 đ'),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Hoa hồng tạm giữ'),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.euro,
                                          color: Colors.amber,
                                        ),
                                        Text('0 đ'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text('Bạn đang có: ${controller.collab.length} cộng tác viên'),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  controller.list.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      controller.isSelected.value = index;
                                    },
                                    child: Obx(
                                      () => Container(
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: controller.isSelected == index ? Colors.blue : Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          controller.list[index],
                                          style: TextStyle(
                                            color: controller.isSelected == index ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: TextField(
                              // style: TextStyle(color: Colors.white),
                              // controller: controller.searchController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 15),
                                icon: Icon(
                                  Icons.search,
                                  // color: Colors.white,
                                  size: 30,
                                ),
                                hintText: 'Tìm kiếm...'.tr,
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                // if (_debounce?.isActive ?? false) _debounce!.cancel();
                                // _debounce = Timer(
                                //   const Duration(milliseconds: 800),
                                //   () {
                                //     controller.submitResults(value.toLowerCase());
                                //   },
                                // );
                              },
                            ),
                          ),
                          ListCollab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              top: check ? 20 : 200,
              bottom: check ? 200 : 20,
              child: Container(),
              duration: Duration(milliseconds: 500),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        width: Get.width,
                        height: Get.height * 0.65,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Tiện ích cộng tác viên',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Colors.grey[200],
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Mã CTV của bạn là: '),
                                          Text(
                                            controller.globalState.user.value.collabCode.toString(),
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Utilities(
                                      icon: Icons.bubble_chart,
                                      title: 'Link giới thiệu cài đặt MFast',
                                      content: 'Link đã bao gồm mã MFast của bạn. Khách hàng cài đặt và đăng ký thành công từ link này đều được ghi nhận là CTV của bạn',
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Utilities(
                                      icon: Icons.bubble_chart,
                                      title: 'Mã QRCode cài đặt MFast',
                                      content: 'Dùng điện thoại khách hàng quét mã QRCode này để dẫn tới link cài đặt trên',
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Utilities(
                                      icon: Icons.bubble_chart,
                                      title: 'Hoa hồng từ cộng tác viên',
                                      content: 'Nhận lên tới 20% hoa hồng từ thu nhập của cộng tác viên kiếm được trên MFast',
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Utilities(
                                      icon: Icons.bubble_chart,
                                      title: 'Danh sách cộng tác viên',
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Utilities(
                                      icon: Icons.bubble_chart,
                                      title: 'Hướng dẫ chi tiết',
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // BubbleSpecialOne(
                    //   text: 'Thêm cộng tác viên',
                    //   color: Color(0xFF1B97F3),
                    //   textStyle: TextStyle(
                    //     fontSize: 16,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_add,
                        color: Color.fromARGB(255, 33, 150, 243),
                        size: 30,
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

class ListCollab extends StatefulWidget {
  ListCollab({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCollab> createState() => _ListCollabState();
}

class _ListCollabState extends State<ListCollab> {
  CollaboratorsController controller = Get.put(CollaboratorsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.collab.length == 0
          ? Column(
              children: [
                Icon(
                  Icons.account_balance_rounded,
                  size: 70,
                  color: Colors.blue,
                ),
                Text('Hiện tại bạn chưa có CTV nào được ghi nhận'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nhận 20% hoa hồng gián tiếp dựa trên doanh số mà CTV tạo ra trên ..... Chi tiết Xem tại đây',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          : Column(
              children: [
                ...controller.collab.map(
                  (element) => Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  element.name.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  element.email.toString(),
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.brown,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Tân thủ - 3'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.brown,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: 'Tính năng hiện đang cập nhật, vui lòng quay lại sau!',
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  // gravity: ToastGravity.CENTER,
                                );
                              },
                              child: Row(
                                children: [
                                  Text('Chat'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Iconsax.message,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 60,
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 60,
                              ),
                              child: Column(
                                children: [
                                  Text('Đã nhận'),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.money,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('0 đ')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text('Tạm giữ'),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.money,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('0 đ')
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: 'Tính năng hiện đang cập nhật, vui lòng quay lại sau!',
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  // gravity: ToastGravity.CENTER,
                                );
                              },
                              child: Row(
                                children: [
                                  Text('Chi tiết'),
                                  SizedBox(
                                    width: 0,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.blue,
                                  ),
                                ],
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
    );
  }
}

class Utilities extends StatelessWidget {
  const Utilities({
    Key? key,
    this.title,
    this.content,
    this.icon,
  }) : super(key: key);
  final String? title;
  final String? content;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!),
              SizedBox(
                height: 10,
              ),
              content != null
                  ? Text(
                      content!,
                      style: TextStyle(fontSize: 11),
                    )
                  : Container(),
            ],
          ),
        ),
        Icon(Icons.keyboard_arrow_right),
      ],
    );
  }
}
