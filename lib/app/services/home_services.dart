import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ykapay/constants.dart';
import 'package:ykapay/models/banner_model.dart';
import 'package:ykapay/models/category_model.dart';
import 'package:ykapay/models/customer_model.dart';
import 'package:ykapay/models/product_model.dart';
import 'package:ykapay/models/user_model.dart';
import 'package:ykapay/utils/http_service.dart';
import 'package:http/http.dart' as http;

class HomeService extends HttpService {
  GetStorage box = GetStorage();

  Future getCategory() async {
    final res = await http.get(Uri.parse('${CONST.API_BASE_URL}/category'));
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<Category> category = List.from(
        bodyResponse['data'].map((element) => Category.fromJson(element)).toList(),
      );
      return category;
    }
  }

  Future getProduct() async {
    final res = await http.get(Uri.parse('${CONST.API_BASE_URL}/product'));
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<ProductModel> product = List.from(
        bodyResponse['data'].map((element) => ProductModel.fromJson(element)).toList(),
      );
      return product;
    }
  }

  Future getBanner() async {
    final res = await http.get(Uri.parse('${CONST.API_BASE_URL}/banner'));
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<Banner> banner = List.from(
        bodyResponse['data'].map((element) => Banner.fromJson(element)).toList(),
      );
      return banner;
    }
  }

  Future getCustomer(int product_id, String year, String month) async {
    final res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/customer?product_id=$product_id&year=$year&month=$month'),
      headers: {'Authorization': 'Bearer ${box.read('token')}'},
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<CustomerModel> customer = List.from(
        bodyResponse['data'].map((element) => CustomerModel.fromJson(element)).toList(),
      );
      return customer;
    } else if (res.statusCode == 401) {
      Get.offAllNamed('login');
      Fluttertoast.showToast(msg: 'Phiên đăng nhập hết hạn, vui lòng đăng nhập lại');
    }
  }

  Future getCollab() async {
    final res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/collab'),
      headers: {'Authorization': 'Bearer ${box.read('token')}'},
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<UserModel> collab = List.from(
        bodyResponse['collab'].map((element) => UserModel.fromJson(element)).toList(),
      );
      return collab;
    } else if (res.statusCode == 401) {
      Get.offAllNamed('login');
      Fluttertoast.showToast(msg: 'Phiên đăng nhập hết hạn, vui lòng đăng nhập lại');
    }
  }

  Future sendOTP({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/user/forget-password/send-otp'),
      body: {
        'email': data['email'],
      },
      headers: {'Authorization': 'Bearer ${box.read('token')}'},
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future verifyOTP({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/user/forget-password/verify-otp'),
      body: {
        'code': data['code'],
        'email': data['email'],
        'new_password': data['new_password'],
      },
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> verifyCode({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/user/forget-password/verify-code'),
      body: {
        'code': data['code'],
        'email': data['email'],
      },
    );
    print({
        'code': data['code'],
        'email': data['email'],
      });
    var bodyResponse = jsonDecode(res.body);
    print(bodyResponse);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else if (res.statusCode == 403) {
      return bodyResponse;
    } else {
      throw '';
    }
  }
}
