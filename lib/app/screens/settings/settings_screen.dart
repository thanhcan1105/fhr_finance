import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ykapay/app/screens/settings/lottery/lottery.dart';
import 'package:ykapay/utils/color.dart';

import '../../../state/global.dart';

class SettingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorFormat.BGColors,
        body: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.28,
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
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('info_user');
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: Get.width * 0.25,
                              width: Get.width * 0.25,
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                'T',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.disabled_by_default,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Get.find<GlobalState>().user.value.name!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone, color: Colors.white),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Get.find<GlobalState>().user.value.phone!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: Get.width * 0.15,
                              width: Get.width * 0.15,
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blue[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ma Mfast cua ban la:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '682904',
                            style: TextStyle(
                              color: Colors.blue[200],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Người hướng dẫn bán hàng:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Bạn là CTV tự do',
                            style: TextStyle(
                              color: Colors.blue[200],
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Ho so
                    ListMenu(
                      isNote: true,
                      label: 'Hồ sơ',
                      list: [
                        ButtonItem(
                          icon: Icons.fact_check_outlined,
                          label: 'Định danh tài khoản',
                          tap: () {
                            // Get.toNamed('verify_account');
                          },
                        ),
                        DividerItem(
                          isIcon: true,
                        ),
                        ButtonItem(
                          icon: Icons.apartment_sharp,
                          label: 'TK ngân hàng và cam kết thuế',
                          disablel: true,
                        ),
                        DividerItem(
                          isIcon: true,
                        ),
                        ButtonItem(
                          icon: Icons.file_open,
                          label: 'Hợp đồng dịnh vụ',
                          disablel: true,
                        ),
                        DividerItem(
                          isIcon: true,
                        ),
                        ButtonItem(
                          icon: Icons.badge,
                          label: 'Ứng tuyển nghiệp vụ tài chính',
                          disablel: true,
                        ),
                      ],
                    ),
                    //That lap chung
                    ListMenu(
                      label: 'Thiết lập chung',
                      list: [
                        ButtonItem(
                          icon: Icons.logout,
                          label: 'Mật khẩu và bảo mật',
                          tap: () {},
                        ),
                        DividerItem(),
                        ButtonItem(
                          icon: Icons.lock,
                          label: 'Thiết lập quyền riêng tư',
                          tap: () {},
                        ),
                        DividerItem(),
                        ButtonItem(
                          icon: Icons.lock,
                          label: 'Lottery',
                          tap: () {
                            Get.to(LotteryScreen());
                          },
                        ),
                      ],
                    ),
                    //trung tam ho tro
                    ListMenu(
                      label: 'Trung tâm hỗ trợ',
                      list: [
                        ButtonItem(
                          icon: Icons.mail,
                          label: 'Email',
                          isIcon: false,
                          textRight: 'thanhcan1105@gmail.com',
                        ),
                        DividerItem(),
                        ButtonItem(
                          icon: Icons.facebook,
                          label: 'Facebook',
                          isIcon: false,
                          textRight: 'Facebook Fanpage',
                        ),
                        DividerItem(),
                        ButtonItem(
                          icon: Icons.logout,
                          label: 'Zalo',
                          isIcon: false,
                          textRight: 'Zalo Panpage',
                        ),
                        DividerItem(),
                        ButtonItem(
                          icon: Icons.info,
                          label: 'Thông tin ứng dụng',
                        ),
                      ],
                    ),
                    //Logout
                    ListMenu(
                      label: '',
                      list: [
                        ButtonItem(
                          tap: () {
                            box.write('token', null);
                            // Get.find<GlobalState>().user.value = null;
                            Get.offAllNamed('login');
                          },
                          icon: Icons.logout,
                          label: 'Đăng xuất',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  const ListMenu({
    Key? key,
    required this.label,
    this.isNote,
    required this.list,
  }) : super(key: key);

  final String label;
  final bool? isNote;
  final List<Widget> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(label),
                Spacer(),
                isNote == true ? Text('Chú thích') : Container(),
                isNote == true
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue),
                        ),
                        alignment: Alignment(0, 0),
                        child: Text(
                          '!',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            width: Get.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: list,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.icon,
    required this.label,
    this.disablel,
    this.isIcon = true,
    this.tap,
    this.textRight,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool? disablel;
  final bool? isIcon;
  final VoidCallback? tap;
  final String? textRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tap!(),
      child: Container(
        height: 25,
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              icon,
              color: disablel == true ? Colors.grey[200] : Colors.blue,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              label,
              style: TextStyle(
                color: disablel == true ? Colors.grey[200] : null,
              ),
            ),
            Spacer(),
            isIcon == true
                ? Icon(
                    Icons.keyboard_arrow_right,
                    color: disablel == true ? Colors.grey[200] : Colors.blue,
                  )
                : Text(
                    textRight!,
                    style: TextStyle(color: Colors.blue),
                  ),
          ],
        ),
      ),
    );
  }
}

class DividerItem extends StatelessWidget {
  const DividerItem({
    Key? key,
    this.isIcon,
  }) : super(key: key);

  final bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isIcon == true
            ? Icon(
                Icons.arrow_downward,
                color: Colors.grey[300],
              )
            : Container(),
        SizedBox(
          width: 7,
        ),
        Container(
          width: Get.width * 0.8,
          child: Divider(
            // thickness: 5,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
