import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemProducts extends StatelessWidget {
  const ItemProducts({
    Key? key,
    required this.logo,
    required this.percent,
    this.isHot,
    this.isNew,
    this.name,
  }) : super(key: key);

  final String logo;
  final String percent;
  final String? name;
  final bool? isHot;
  final bool? isNew;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: isNew == true ? Colors.blue[900] : Colors.transparent,
          height: Get.height * 0.13,
          width: Get.width * 0.19,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(
            right: Get.width * 0.01,
            bottom: Get.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: logo,
                height: Get.height * 0.03,
                width: Get.width * 0.12,
              ),
              SizedBox(
                height: 3,
              ),
              name!.isEmpty
                  ? Container()
                  : Text(
                      name!,
                      style: TextStyle(
                        color: isNew == true ? Colors.white : Colors.black,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                    ),
              SizedBox(
                height: 3,
              ),
              percent.isEmpty
                  ? Container()
                  : Text(
                      percent,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      ),
                    ),
            ],
          ),
        ),
        isHot == true
            ? Positioned(
                top: 3,
                right: 3,
                child: Container(
                  padding: EdgeInsets.all(0.5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    // shape: BoxShape.circle
                  ),
                  child: Text(
                    'Hot',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            : Positioned(child: Text('')),
        isNew == true
            ? Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(0.5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    // shape: BoxShape.circle
                  ),
                  child: Text(
                    'New',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            : Positioned(child: Text('')),
      ],
    );
  }
}
