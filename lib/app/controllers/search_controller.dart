import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ykapay/app/controllers/splash_controller.dart';
import 'package:ykapay/app/db/product_db.dart';
import 'package:ykapay/models/product_model.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with GetTool {
  // handle here
  GetStorage box = GetStorage();
  SplashController splashController = Get.put(SplashController());

  RxBool isLoading = false.obs;
  RxInt isResults = 0.obs;
  RxList<ProductModel> results = <ProductModel>[].obs;
  RxList<ProductModel> recentSearch = <ProductModel>[].obs;
  final TextEditingController textController = new TextEditingController();
  final db = ProductDatabase.instance;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    recentSearch.value = await db.readAllProduct();
    isLoading.value = false;
  }

  submitResults(val) {
    results.clear();
    // results.addAll(splashController.product.where((e) => e.name!.toLowerCase() == val));
    for (var res in splashController.product) {
      if (res.name!.toLowerCase().contains(val)) {
        results.add(res);
      }
    }
  }

  submitRecentSearch(product) {
    if (recentSearch.length < 5) {
      if (!recentSearch.any((e) => e.id == product.id)) {
        recentSearch.insert(0, product);
        // db.create(product);
      } else {
        recentSearch.removeAt(recentSearch.indexWhere((element) => element.id == product.id));
        recentSearch.insert(0, product);
        // db.delete(product.id);
        // db.create(product);
      }
    } else if (recentSearch.length == 5) {
      if (recentSearch.any((e) => e.id == product.id)) {
        recentSearch.removeAt(recentSearch.indexWhere((element) => element.id == product.id));
        recentSearch.insert(0, product);
        // db.delete(product.id);
        // db.create(product);
      } else {
        recentSearch.removeAt(4);
        recentSearch.insert(0, product);
        // db.delete();
        // db.create(product);
      }
    }
    db.deleteAll();
    for (var res in recentSearch) {
      db.create(res);
    }
  }

  delete() {
    db.deleteAll();
  }
}
