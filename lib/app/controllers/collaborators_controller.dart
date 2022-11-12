import 'package:ykapay/app/services/home_services.dart';
import 'package:ykapay/models/user_model.dart';
import 'package:ykapay/state/global.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CollaboratorsController extends GetxController with GetTool {
  GetStorage box = GetStorage();

  RxInt isSelected = 0.obs;
  RxBool isLoading = false.obs;
  RxList<UserModel> collab = <UserModel>[].obs;
  GlobalState globalState = Get.find();

  final List list = [
    'Tất cả',
    'Đang hoạt động',
    'Không hoạt động',
    'Có doanh số',
    'Không mở app trong 1 tuần',
    'Không mở app trong một tháng',
  ];

  @override
  void onInit() {
    getCollab();
    super.onInit();
  }

  getCollab() async {
    isLoading.value = true;
    var res = await HomeService().getCollab();
    collab.assignAll(res);
    isLoading.value = false;
  }

  submitSelect(index) {}
}
