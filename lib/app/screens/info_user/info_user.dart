import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/state/global.dart';
import 'package:ykapay/utils/color.dart';
import 'package:ykapay/utils/text_input.dart';
import 'package:ykapay/utils/time.dart';

class InfoUserScreen extends GetView {
  GlobalState globalState = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFormat.BGColors,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          'Thông tin cá nhân',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height * 0.15,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: Get.width * 0.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${globalState.user.value.name}',
                                          style: TextStyle(
                                            color: Colors.indigoAccent,
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            // showAboutDialog(context: context);
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) => GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context).requestFocus(new FocusNode());
                                                },
                                                child: Scaffold(
                                                  backgroundColor: Colors.transparent,
                                                  // body: Column(
                                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                                  //   children: [
                                                  //     Container(
                                                  //       alignment: Alignment.center,
                                                  //       color: Colors.amber,
                                                  //       height: 50,
                                                  //       width: 50,
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  body: Center(
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                                      width: Get.width * 0.8,
                                                      height: Get.height * 0.275,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Icon(
                                                                Icons.person_search,
                                                                color: Colors.blue,
                                                                size: 30,
                                                              ),
                                                              Text(
                                                                'Thay đổi tên của bạn',
                                                                style: TextStyle(
                                                                  color: Colors.blue,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          TextFormField(
                                                            textAlign: TextAlign.center,
                                                            autofocus: true,
                                                            decoration: InputDecoration(
                                                              // isCollapsed: true,
                                                              // isDense: true,
                                                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                                              hintText: 'Nhập tên của bạn',
                                                              border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Colors.blue,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    Get.back();
                                                                  },
                                                                  child: Container(
                                                                    height: 50,
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                                                                    child: Text(
                                                                      'Đóng',
                                                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                width: 10,
                                                                thickness: 10,
                                                              ),
                                                              Expanded(
                                                                child: Container(
                                                                  height: 50,
                                                                  alignment: Alignment.center,
                                                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                                                                  child: Text(
                                                                    'Cập nhật',
                                                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Sửa'.tr,
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Ngày tham gia - ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          $Datetime.formatFromString(globalState.user.value.createdAt.toString(), 'dd/MM/yyyy'),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mã Mfast:',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text('682904'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Người hướng dẫn:',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text('Bạn là CTV tự do'),
                                                Icon(Icons.keyboard_arrow_right),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cấp bậc hiện tại:'),
                                    Row(
                                      children: [
                                        Text('Tân thủ - 1 *'),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListMenu(
                      label: 'Thông tin liên hệ',
                      list: [
                        ItemMenu(nameLeft: 'Email', nameRight: '${globalState.user.value.email}'),
                        // ItemMenu(nameLeft: 'Số điện thoại', nameRight: '0337528536'),
                        ItemMenu(nameLeft: 'Huyện/ Tỉnh', nameRight: '-'),
                      ],
                    ),
                    ListMenu(
                      label: 'Thông tin định danh',
                      list: [
                        ItemMenu(nameLeft: 'Họ tên', nameRight: globalState.user.value.name.toString()),
                        ItemMenu(nameLeft: 'Số điện thoại', nameRight: globalState.user.value.phone.toString()),
                        ItemMenu(nameLeft: 'Số CMND / CCCD', nameRight: globalState.user.value.cccd.toString()),
                        ItemMenu(nameLeft: 'Ngày cấp', nameRight: '-'),
                        ItemMenu(nameLeft: 'Nơi cấp', nameRight: '-'),
                      ],
                    ),
                    ListMenu(
                      isNotEdit: true,
                      label: 'Thông tin tài khoản',
                      list: [
                        Text(
                          'Tài khoản MFast sẽ tự động đóng, số dư tiền và các thông tin đi kèm cũng sẽ hủy theo khi không sử dụng trong 6 tháng. Chi tiết tại điều khoản sử dụng.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Đăng xuất'),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(
                              Icons.disabled_by_default_outlined,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Đăng xuất tất cả thiết bị'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
    this.isNotEdit,
  }) : super(key: key);

  final String label;
  final bool? isNote;
  final List<Widget> list;
  final bool? isNotEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: isNotEdit == true
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(label),
                      Spacer(),
                      Text(
                        'Sửa',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ],
                  ),
          ),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: list,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key? key,
    required this.nameLeft,
    required this.nameRight,
  }) : super(key: key);

  final String nameLeft;
  final String nameRight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nameLeft,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(nameRight),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
