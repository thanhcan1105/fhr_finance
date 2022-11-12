import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/splash_controller.dart';
import 'package:ykapay/app/screens/item/item_screen.dart';

class MySearchDelegate extends SearchDelegate<String> {
  final List<String>? allProduct;
  final List<String>? productSuggestion;

  SplashController splashController = Get.put(SplashController());

  MySearchDelegate({this.allProduct, this.productSuggestion});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.amber,
        //app bar color I wanted
      ),
    );
  }

  // @override
  // String? get searchFieldLabel => 'Tìm kiếm...';

  //////

  @override
  TextStyle? get searchFieldStyle => TextStyle(color: Colors.white);

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      floatingLabelStyle: TextStyle(
        color: Colors.white,
      ),
      labelStyle: TextStyle(color: Colors.white, fontSize: 50),
      iconColor: Colors.cyan,
      prefixIconColor: Colors.cyan,
      fillColor: Colors.cyan);

/////
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            // Get.back();
            query = '';
          },
          child: Text(
            'Đóng',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // final allResults = allProduct?.where((element) => element.toLowerCase().contains(query.toLowerCase()));
    // return ListView.builder(itemBuilder: (context, index) => Scaffold());
    return Center(
      child: Text('test'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sản phẩm nổi bật'),
          Wrap(
            children: [
              ...splashController.product.where((e) => e.isHot == 1).map(
                    (e) => GestureDetector(
                      onTap: () {
                        Get.to(ItemScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: 10),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: e.image!,
                              height: 50,
                              width: 50,
                            ),
                            // Text(e.name!),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          ),
          Text('Tìm kiếm gần đây')
        ],
      ),
    );
  }
}
