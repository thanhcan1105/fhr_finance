import 'package:ykapay/app/services/auth_services.dart';
import 'package:ykapay/app/services/home_services.dart';
import 'package:ykapay/models/banner_model.dart';
import 'package:ykapay/models/category_model.dart';
import 'package:ykapay/models/product_model.dart';
import 'package:ykapay/state/global.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/notification_service.dart';

class SplashController extends GetxController with GetTool {
  GetStorage box = GetStorage();

  RxBool isLoading = false.obs;

  RxList<Category> category = <Category>[].obs;
  RxList<ProductModel> product = <ProductModel>[].obs;
  RxList<Banner> banner = <Banner>[].obs;
  GlobalState globalState = Get.put(GlobalState());
  GlobalState global = Get.find();

  @override
  void onInit() async {
    var deviceToken = PushNotificationsManager().init();
    box.write('deviceToken', deviceToken);
    isLoading.value = true;
    await getCategory();
    await getProduct();
    await getBanner();
    await getUser();
    isLoading.value = false;

    if (!box.hasData('token')
        //  || global.user.value.name == null
        ) {
      await Future.delayed(Duration(seconds: 2), () {
        Get.offAllNamed('login');
      });
    } else {
      await Future.delayed(
        Duration(seconds: 1),
        () {
          getUser();
          Get.offAllNamed('bottom_menu');
        },
      );
    }

    super.onInit();
  }

  getCategory() async {
    var response = await HomeService().getCategory();
    category.assignAll(response);
    print(response); 
  }

  getProduct() async {
    var response = await HomeService().getProduct();
    product.assignAll(response);
  }

  getBanner() async {
    var response = await HomeService().getBanner();
    banner.assignAll(response);
  }

  getUser() async {
    await AuthService().getUser();
  }
}
