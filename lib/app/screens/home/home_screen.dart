import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/home_controller.dart';
import 'package:ykapay/app/controllers/splash_controller.dart';
import 'package:ykapay/app/screens/home/component/item_product.dart';
import 'package:ykapay/app/screens/home/component/menu_product.dart';
import 'package:ykapay/app/screens/home/component/search.dart';
import 'package:ykapay/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  var iconContainerHeight = 55.00;

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorFormat.BGColors,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              child: Container(
                height: Get.height * 0.25,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            RefreshIndicator(
              onRefresh: () async {
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            //search
                            Container(
                              height: Get.height * 0.05,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.none,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15, color: Colors.white),
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  hintText: 'Tìm kiếm...'.tr,
                                  border: InputBorder.none,
                                ),
                                onTap: () {
                                  Get.to(() => SearchScreen(), transition: Transition.cupertino);
                                },
                              ),
                            ),
                            //info, notification
                            Container(
                              height: Get.height * 0.11,
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.amber,
                                    )
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    margin: EdgeInsets.only(top: Get.width * 0.05),
                                    width: Get.width * 0.45,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed('info_user');
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Xin chào!'.tr,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Row(
                                            children: [
                                              Obx(
                                                () => controller.isLoading.value
                                                    ? CircularProgressIndicator(
                                                        color: Colors.white,
                                                      )
                                                    : Flexible(
                                                        fit: FlexFit.loose,
                                                        child: Text(
                                                          controller.globalState.user.value.name!,
                                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                                        ),
                                                      ),
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down_rounded,
                                                color: Colors.white,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  //asdfasf
                                  InkWell(
                                    onTap: () {
                                      // NotificationApi.showNotification(title: 'holle', body: 'hello');
                                      // print(controller.user.value.name);
                                      print(controller.globalState.user.value.name);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                      height: Get.height * 0.12,
                                      width: Get.width * 0.12,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[300],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.message,
                                        color: Colors.white,
                                        size: Get.height * 0.03,
                                      ),
                                    ),
                                  ),
                                  //asdfhjksdfhjkl//asdfasdfasdfdfsdf
                                  InkWell(
                                    onTap: () async {},
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      height: Get.height * 0.12,
                                      width: Get.width * 0.12,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[300],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.notifications_rounded,
                                        color: Colors.white,
                                        size: Get.height * 0.04,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //money(tien tich luy)
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('accumulated_income');
                              },
                              child: Container(
                                height: Get.height * 0.06,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      offset: Offset(0.0, 0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text('Tiền tích lũy'.tr),
                                      Spacer(),
                                      Text(
                                        '0 đ',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //banner slider
                      SliderBanner(),
                      //product
                      Obx(
                        () => Column(
                          children: [
                            ...splashController.category.map(
                              (element) => MenuProducts(
                                title: element.name!,
                                list: [
                                  ...splashController.product.where((e) => e.categoryId == element.id).map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            Get.toNamed('item', arguments: {'product': e});
                                            // print(e.id);
                                          },
                                          child: ItemProducts(
                                            isHot: e.isHot == 1 ? true : false,
                                            isNew: e.isNew == 1 ? true : false,
                                            name: e.name == null ? '' : e.name,
                                            logo: e.image.toString(),
                                            percent: e.interest == null ? '' : e.interest.toString(),
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      News(splashController: splashController),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class News extends StatelessWidget {
  const News({
    Key? key,
    required this.splashController,
  }) : super(key: key);

  final SplashController splashController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Text(
                'Tin tức, khuyến mãi',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                'Tất cả'.tr,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                ...splashController.banner.map(
                  (element) => InkWell(
                    onTap: () async {
                      // Get.to(NewsScreen());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10, bottom: 5),
                          width: Get.width * 0.5,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(element.image!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text('data' * 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                Text(
                  'Mẹo dành cho bạn'.tr,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  'Tất cả'.tr,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Obx(
            () => CarouselSlider(
              options: CarouselOptions(
                height: Get.height * 0.25,
                disableCenter: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: splashController.banner.map((e) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e.image!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payLoad,
      );
}
