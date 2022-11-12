import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ykapay/app/controllers/splash_controller.dart';
import 'package:ykapay/app/screens/item/component/tabber3.dart';
import 'package:ykapay/app/services/auth_services.dart';
import 'package:ykapay/app/services/home_services.dart';
import 'package:ykapay/models/customer_model.dart';
import 'package:ykapay/utils/get_tool/get_tool.dart';
import 'package:ykapay/utils/time.dart';

class ItemController extends GetxController with GetTool {
  var product = Get.arguments;

  RxList<CustomerModel> customer = <CustomerModel>[].obs;
  RxList<CustomerModel> allCustomer = <CustomerModel>[].obs;

  RxList<int> validatedStep = <int>[].obs;

  @override
  void onInit() async {
    await getCustomer();
    super.onInit();
  }

  getCustomer() async {
    isLoading.value = true;
    customer.value = [];
    var response = await HomeService().getCustomer(product['product'].id, year.value, month.value);
    allCustomer.assignAll(response);
    customer.assignAll(response);
    isLoading.value = false;
  }

  RxInt index = 0.obs;
  RxBool isChecked = false.obs;

  RxBool isMale = true.obs;
  RxBool isFemale = false.obs;

  SplashController splashController = Get.put(SplashController());

  //tabbar 2

  TextEditingController nameCustomerController = TextEditingController();
  TextEditingController cccdCustomerController = TextEditingController();
  TextEditingController phoneCustomerController = TextEditingController();
  TextEditingController addressCustomerController = TextEditingController();
  TextEditingController genderCustomerController = TextEditingController();

  RxBool isValidateName = false.obs;
  RxBool isValidateCCCD = false.obs;
  RxBool isValidatePhone = false.obs;
  RxBool isValidateAddress = false.obs;

  formValidate() {
    if (isValidateName.value && isValidateCCCD.value && isValidatePhone.value && isValidateAddress.value && isChecked == true) {
      isEnableSubmit.value = true;
      validatedStep.assign(1);
      return true;
    }
    isEnableSubmit.value = false;
    validatedStep.remove(1);
    return false;
  }

  handleSubmit() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    if (isValidateName.value && isValidateCCCD.value && isValidatePhone.value && isValidateAddress.value && isChecked == true) {
      Map<String, dynamic> data = {
        'name_customer': nameCustomerController.text.trim(),
        'cccd_customer': cccdCustomerController.text.trim(),
        'phone_customer': phoneCustomerController.text.trim(),
        'address_customer': addressCustomerController.text.trim(),
        'gender_customer': isMale.value == true ? "Male" : "Female",
        'product_id': product["product"].id.toString(),
      };
      var response = await AuthService().addCustomer(data: data);
      if (response != null) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        nameCustomerController.clear();
        cccdCustomerController.clear();
        phoneCustomerController.clear();
        addressCustomerController.clear();
        isMale.value = true;
        isFemale.value = false;
        isChecked .value = false;
        Get.toNamed('item');
        notify.success(message: 'Thêm khách hàng thành công!!', title: 'Thành công');
        isSubmitting.value = true;
      } else {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        notify.error(message: 'Thêm khách hàng thất bại!!', title: 'Thất bại');
      }
    }
  }

  void check() {
    if (isChecked == false) {
      isChecked.value = true;
    } else {
      isChecked.value = false;
    }
  }

  //tabbar 3
  TextEditingController searchController = TextEditingController();

  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  RxBool isLoading = false.obs;
  RxInt isSelected = 0.obs;
  RxString date = 'Theo ngày'.obs;
  RxString datePicked = ''.obs;
  RxString year = '0'.obs;
  RxString month = '0'.obs;

  RxList list = ['Tất cả ', 'Theo ngày'].obs;

  void date_picked(value) {
    datePicked.value = '';
    String val = DateFormat('MM / yyyy').format(value);
    datePicked.value = val;
  }

  submitResults(val) {
    isLoading.value = true;
    customer.clear();
    for (var res in allCustomer) {
      if (res.nameCustomer!.toLowerCase().contains(val) || res.phoneCustomer!.toLowerCase().contains(val)) {
        customer.add(res);
      }
    }
    isLoading.value = false;
  }

  onRefresh() {
    year.value = '0';
    date.value = 'Theo ngày';
    searchController.clear();
    isSelected.value = 0;
    getCustomer();
  }

  submitSelect(context, index) {
    isSelected.value = index;
    if (isSelected != 1) {
      date.value = 'Theo ngày';
    }
    if (isSelected == 0) {
      year.value = '0';
      getCustomer();
    } else if (isSelected == 1) {
      DatePicker.showPicker(
        context,
        showTitleActions: true,
        pickerModel: CustomMonthPicker(
          minTime: DateTime(2018, 3, 5),
          maxTime: DateTime.now(),
          currentTime: DateTime.now(),
          locale: LocaleType.vi,
        ),
        onChanged: (value) {},
        onConfirm: (value) {
          selectedDate(value);
        },
        locale: LocaleType.vi,
      );
    }
  }

  void selectedDate(value) {
    date.value = $Datetime.formatFromString(value.toString(), 'MM/yyyy');
    year.value = $Datetime.formatFromString(value.toString(), 'yyyy');
    month.value = $Datetime.formatFromString(value.toString(), 'MM');
    allCustomer.clear();
    customer.clear();
    getCustomer();
  }

  // RxInt product_id = 0.obs;
  //---------------------------

}
