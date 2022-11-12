import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController controller = Get.put(SearchController());

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: Get.height * 0.12,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Obx(
                    () => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.75,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: TextFormField(
                                controller: controller.textController,
                                autofocus: true,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15, color: Colors.white),
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  hintText: 'Tìm kiếm...'.tr,
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      controller.textController.text = '';
                                      controller.isResults.value = 0;
                                    },
                                    icon: controller.textController.text.length > 0
                                        ? Icon(
                                            Icons.highlight_remove,
                                            color: Colors.white,
                                          )
                                        : Icon(null),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                                  _debounce = Timer(const Duration(milliseconds: 800), () {
                                    if (value.isNotEmpty) {
                                      controller.isResults.value = 1;
                                    } else {
                                      controller.isResults.value = 0;
                                    }
                                    controller.submitResults(value.toLowerCase());
                                  });
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                // controller.recentSearch.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Đóng',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        controller.isResults == 0 ? onSuggestions() : onResults(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView onSuggestions() => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Text('Sản phẩm nổi bật'),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            crossAxisCount: 4,
            children: [
              ...controller.splashController.product.where((e) => e.isHot == 1).map(
                    (e) => GestureDetector(
                      onTap: () async {
                        await controller.submitRecentSearch(e);
                        Get.toNamed('item', arguments: {'product': e});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.025),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: e.image!,
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              e.name!,
                              style: TextStyle(
                                fontSize: 11,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tìm kiếm gần đây'),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  color: Colors.amber,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // recentSearch.clear();
                  // controller.delete();
                  
                },
                child: Text(
                  'Xóa',
                  style: TextStyle(
                    color: Colors.blue,
                    // fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          ...controller.recentSearch.map(
            (e) => GestureDetector(
              onTap: () async {
                await controller.submitRecentSearch(e);
                Get.toNamed('item', arguments: {'product': e});
              },
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: e.image!,
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(e.name!),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right_outlined),
                    // Icon(
                    //   Icons.highlight_remove,
                    //   color: Colors.red,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Column onResults() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.results.isEmpty ? Text('Không tìm thấy sản phẩm.') : Text('Kết quả tìm kiếm'),
          ...controller.results.map(
            (e) => GestureDetector(
              onTap: () async {
                await controller.submitRecentSearch(e);
                Get.toNamed('item', arguments: {'product': e});
              },
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: e.image!,
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(e.name!),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right_outlined),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
