import 'package:get/get.dart';
import 'package:ykapay/models/user_model.dart';

class GlobalState extends GetXState{
  Rx<UserModel> user = UserModel().obs;
}