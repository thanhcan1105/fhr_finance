import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/customer_controller.dart';
import 'package:ykapay/utils/color.dart';

class CustomerScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    CustomerController controller = Get.put(CustomerController());
    return Scaffold(
      backgroundColor: ColorFormat.BGColors,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            width: Get.width,
                            height: Get.height,
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.blue,
                        ),
                        Text('Lọc'),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Khách hàng',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Stack(
                              children: [
                                Positioned(
                                  top: 40,
                                  right: 20,
                                  child: Container(
                                    height: 400,
                                    width: Get.width * 0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text('Ghi chú'),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 13,
                          width: 13,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            shape: BoxShape.circle,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.exclamation,
                            size: 8,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lọc theo:'),
                  Text('Tất cả'),
                  Text('Tất cả'),
                  Text('Mới nhất lên đầu'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bạn có:'),
                    SizedBox(
                      width: 5,
                    ),
                    ...List.generate(
                      list.length,
                      (index) => InkWell(
                        onTap: () {
                          controller.isSelected.value = index;
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(right: 10),
                            height: 30,
                            decoration: BoxDecoration(
                              color: controller.isSelected.value == index ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              list[index].toString(),
                              style: TextStyle(
                                color: controller.isSelected.value == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.font_download_off_rounded,
              color: Colors.blue,
              size: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2, vertical: 10),
              child: Text(
                'Hiện chưa có khách hàng nào tham gia liên kết bán hàng của bạn',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: 10),
              child: Text(
                'Liên Kết Bán Hàng trên ..... giúp bạn đem về thu nhập 8 chữ số, xem chi tiết tại đây',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List list = ['Tất cả (0)', 'Chờ xử lý (0)', 'Đang xử lý (0)', 'Không tiền năng (0)'];
}
