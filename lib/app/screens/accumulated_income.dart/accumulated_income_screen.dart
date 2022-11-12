import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/utils/color.dart';

class AccumulatedIncomeScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorFormat.BGColors,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorFormat.BGColors,
          centerTitle: true,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Tiền tích lũy'.tr,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
              // margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('Tiền tích lũy hiện tại'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money_sharp,
                          color: Colors.blue,
                        ),
                        Text('0 vnđ')
                      ],
                    ),
                    Divider(
                      height: 10,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        'Tài khoản .... sẽ tự động đóng, số dư tiền và các thông tin đi kèm sẽ hủy theo khi không sử dụng trong 6 tháng. Chi tiết tại điều khoản sử dụng.'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
