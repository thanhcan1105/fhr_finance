import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ykapay/app/controllers/community_controller.dart';

class Tabbar1 extends StatelessWidget {
  Tabbar1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommunityController controller = Get.put(CommunityController());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Danh sách yêu cầu hỗ trợ',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      list.length,
                      (index) => InkWell(
                        onTap: () {
                          controller.isSelected.value = index;
                        },
                        child: Obx(
                          () => Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: controller.isSelected.value == index ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              list[index],
                              style: TextStyle(
                                color: controller.isSelected.value == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.width * 0.3,
              ),
              Icon(
                Icons.folder_off_sharp,
                color: Colors.blue,
                size: 70,
              ),
              Text('Hiện tại chưa có yêu cầu hỗ trợ nào'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  'Nếu có bất kỳ câu hỏi nào, bấm tạo yêu cầu Mfast sẽ sớm phản hồi thắc mắc của bạn tại đây',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BubbleSpecialOne(
                  text: 'Tạo yêu cầu hỗ trợ',
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Iconsax.message_add_1,
                    color: Color.fromARGB(255, 33, 150, 243),
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  final List list = ['0 Tất cả', '0 Chờ trả lời', '0 Đã trả lời', '0 Đã đóng'];
}
