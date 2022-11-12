import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ykapay/constants.dart';
import 'package:ykapay/models/user_model.dart';
import 'package:ykapay/utils/http_service.dart';
import 'package:http/http.dart' as http;

class AuthService extends HttpService {
  GetStorage box = GetStorage();
 
  Future login({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/login'),
      body: {
        'email': data['email'],
        'password': data['password'],
      },
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future register({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/register'),
      body: {
        "name": data['name'],
        "email": data['email'],
        "phone": data["phone"],
        "cccd": data["cccd"],
        "password": data['password'],
      },
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    }
  }

  Future<UserModel> getUser() async {
    var res = await http.get(Uri.parse('${CONST.API_BASE_URL}/user-info'), headers: {'Authorization': 'Bearer ${box.read('token')}'});
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      final user = UserModel.fromJson(bodyResponse['user']);
      return user;
    } else if (res.statusCode == 401) {
      Get.offAllNamed('login');
      return bodyResponse;
    } else {
      throw Exception("False to load user");
    }
  }

  Future addCustomer({required Map<String, dynamic> data}) async {
    final res = await http.post(Uri.parse('${CONST.API_BASE_URL}/add-customer'), body: data, headers: {'Authorization': 'Bearer ${box.read('token')}'});

    var bodyResponse = jsonDecode(res.body);
    print(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    }
  }
}
