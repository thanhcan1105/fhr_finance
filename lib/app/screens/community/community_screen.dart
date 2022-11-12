import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ykapay/app/screens/community/component/tab2.dart';
import 'package:ykapay/app/screens/community/component/tab3.dart';
import 'package:ykapay/utils/color.dart';

import 'component/tab1.dart';

class CommunityScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          backgroundColor: ColorFormat.BGColors,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.5,
            backgroundColor: ColorFormat.BGColors,
            title: Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey[400]),
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                  hintText: 'Tìm kiếm...'.tr,
                  border: InputBorder.none,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          width: Get.width,
                          height: 300,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Khởi tạo',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Colors.grey[300],
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
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
                                            Icons.chat_bubble,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Cuộc trò chuyện mới'),
                                        Spacer(),
                                        Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
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
                                            Icons.person_outline_rounded,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Thêm liên hệ mới'),
                                        Spacer(),
                                        Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
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
                                            Iconsax.message_add_1,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Tạo yêu cầu hỗ trợ mới'),
                                        Spacer(),
                                        Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              )
            ],
            bottom: TabBar(
              // isScrollable: true,
              automaticIndicatorColorAdjustment: false,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Phòng hỗ trợ'.tr,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Tin nhắn'.tr,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Liên hệ'.tr,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Tabbar1(),
              Tabbar2(),
              Tab3(),
            ],
          ),
        ),
      ),
    );
  }
}
