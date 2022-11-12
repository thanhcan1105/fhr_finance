import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tab3 extends StatefulWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_add_alt_1,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Danh sách các yêu cầu kết bạn'),
              Spacer(),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Column(
            children: [
              Icon(
                Icons.wind_power,
                color: Colors.green,
                size: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: Get.width * 0.85,
                child: Text(
                  'Bấm thêm liên hệ để tìm kiếm và kết nối cùng cộng đồng Mfast.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
