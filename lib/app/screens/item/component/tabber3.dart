import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/item_controller.dart';
import 'package:ykapay/utils/time.dart';

class Tabbar3 extends StatefulWidget {
  const Tabbar3({
    Key? key,
  }) : super(key: key);

  @override
  State<Tabbar3> createState() => _Tabbar3State();
}

class CustomMonthPicker extends DatePickerModel {
  CustomMonthPicker({DateTime? currentTime, DateTime? minTime, DateTime? maxTime, LocaleType? locale})
      : super(
          locale: locale,
          minTime: minTime,
          maxTime: maxTime,
          currentTime: currentTime,
        );

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }
}

class _Tabbar3State extends State<Tabbar3> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  ItemController controller = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            controller.onRefresh();
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.height + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Hoa hồng đã nhận'),
                            Text('Hoa hồng tạm giữ'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.euro,
                                  color: Colors.blue,
                                ),
                                Text('0 đ'),
                              ],
                            ),
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
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Điểm tính nhiệm'),
                            Spacer(),
                            Text('500/500'),
                            Spacer(),
                            Text('Chi tiết điểm'),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                        Container(
                          width: Get.width,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text('Dự án:'),
                                SizedBox(
                                  width: 5,
                                ),
                                ...List.generate(
                                  controller.list.length,
                                  (index) => InkWell(
                                    onTap: () {
                                      controller.submitSelect(context, index);
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
                                        child: Row(
                                          children: [
                                            controller.isSelected.value == index && controller.isSelected.value == 1
                                                ? Text(
                                                    '${controller.date}',
                                                    style: TextStyle(
                                                      color: controller.isSelected.value == index ? Colors.white : Colors.black,
                                                    ),
                                                  )
                                                : Text(
                                                    controller.list[index].trim().toString(),
                                                    style: TextStyle(
                                                      color: controller.isSelected.value == index ? Colors.white : Colors.black,
                                                    ),
                                                  ),
                                            controller.isSelected.value == index
                                                ? Text(
                                                    ' (${controller.customer.length})',
                                                    style: TextStyle(
                                                      color: controller.isSelected.value == index ? Colors.white : Colors.black,
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: TextField(
                              // style: TextStyle(color: Colors.white),
                              controller: controller.searchController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 15),
                                icon: Icon(
                                  Icons.search,
                                  // color: Colors.white,
                                  size: 30,
                                ),
                                hintText: 'Nhập tên hoặc số điện thoại cần tìm...'.tr,
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (_debounce?.isActive ?? false) _debounce!.cancel();
                                _debounce = Timer(
                                  const Duration(milliseconds: 800),
                                  () {
                                    controller.submitResults(value.toLowerCase());
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                        : Center(
                            child: controller.customer.length == 0
                                ? Container(
                                    padding: EdgeInsets.only(top: 50),
                                    width: Get.width,
                                    alignment: Alignment.center,
                                    child: Text('Không tìm thấy hồ sơ nào!'),
                                  )
                                : Column(
                                    children: [
                                      ...controller.customer.map(
                                        (element) => GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                            padding: EdgeInsets.all(10),
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
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // Text('Logo'),
                                                        CachedNetworkImage(
                                                          imageUrl: controller.splashController.product.firstWhere((e) => e.id == element.productId).image.toString(),
                                                          width: 30,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text('Số điện thoại:'),
                                                        Text('Hoa hồng:'),
                                                        Text('Nhiệm vụ:'),
                                                        Text('Trạng thái:'),
                                                        // Text('KH của:'),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.filter_frames_outlined,
                                                              size: 15,
                                                              color: Colors.blue,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              element.nameCustomer.toString(),
                                                              style: TextStyle(fontWeight: FontWeight.bold),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(element.phoneCustomer.toString()),
                                                        Text('0đ'),
                                                        Text('Hỗ trợ thu hồ sơ'),
                                                        Text('Đang xử lý'),
                                                        // Text(element.id.toString()),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.keyboard_arrow_right_outlined,
                                                          color: Colors.grey,
                                                          size: 50,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  // $Datetime.formatFromString(element.createdAt.toString(), 'dd/MM/yyyy'),
                                                  $Datetime.timeAgo(DateTime.parse('${element.createdAt}')),
                                                  style: TextStyle(fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Positioned(
        //   bottom: 20,
        //   right: 20,
        //   child: GestureDetector(
        //     onTap: () {
        //     },
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         BubbleSpecialOne(
        //           text: 'Thêm Khánh Hàng',
        //           color: Color(0xFF1B97F3),
        //           textStyle: TextStyle(
        //             fontSize: 16,
        //             color: Colors.white,
        //           ),
        //         ),
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             border: Border.all(color: Colors.blue),
        //             shape: BoxShape.circle,
        //           ),
        //           child: Icon(
        //             Icons.filter_frames_rounded,
        //             color: Color.fromARGB(255, 33, 150, 243),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
