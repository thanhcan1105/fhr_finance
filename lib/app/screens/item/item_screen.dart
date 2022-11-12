import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/item_controller.dart';
import 'package:ykapay/app/screens/item/component/tabar1.dart';
import 'package:ykapay/app/screens/item/component/tabbar2.dart';
import 'package:ykapay/app/screens/item/component/tabber3.dart';
import 'package:ykapay/utils/color.dart';

class ItemScreen extends GetView<ItemController> {
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
            elevation: 0.5,
            backgroundColor: ColorFormat.BGColors,
            centerTitle: true,
            title: Text(
              controller.product["product"].name,
              style: TextStyle(color: Colors.black),
            ),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            bottom: TabBar(
              // isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Giới thiệu'.tr,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Thêm hồ sơ'.tr,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Quản lý hồ sơ'.tr,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Tabbar1(),
              Tabbar2(),
              Tabbar3(),
            ],
          ),
        ),
      ),
    );
  }
}
