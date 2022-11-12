import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuProducts extends StatefulWidget {
  const MenuProducts({
    Key? key,
    required this.title,
    required this.list,
  }) : super(key: key);

  final String title;
  final List<Widget> list;

  @override
  State<MenuProducts> createState() => _MenuProductsState();
}

class _MenuProductsState extends State<MenuProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: Get.height * 0.02,
                  width: Get.width * 0.04,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(), shape: BoxShape.circle),
                  child: FaIcon(
                    FontAwesomeIcons.exclamation,
                    size: 8,
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Tất cả'.tr,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        Container(
          // padding: EdgeInsets.all(20),
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            // runSpacing: 20,
            // spacing: Get.width * 0.074,
            children: widget.list,
          ),
        ),
      ],
    );
  }
}
