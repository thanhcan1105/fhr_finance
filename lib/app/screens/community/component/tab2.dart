import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tabbar2 extends StatefulWidget {
  const Tabbar2({Key? key}) : super(key: key);

  @override
  State<Tabbar2> createState() => _Tabbar2State();
}

class _Tabbar2State extends State<Tabbar2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(15),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_add,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.yard_outlined,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.85,
              child: Text(
                'Kết nối thêm bạn bè, đồng nghiệp để cùng trò chuyện và trao dổi công việc trên MFast nhé !!!',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
