
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 80.0,
                  height: 80.0,
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 24.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                      'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')),
              const SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30.0),
              //   child: Obx(
              //     () => controller.isLoading.value
              //         ? const CircularProgressIndicator(
              //             color: Colors.red,
              //           )
              //         : Text(
              //             "${controller.user.value.fullName}",
              //             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              //           ),
              //   ),
              // ),
              const Spacer(),
              Divider(
                color: Colors.grey.shade800,
              ),
              ListTile(
                onTap: () {
                  // controller.handleUser();
                  Get.toNamed('home');
                },
                leading: const Icon(Iconsax.home),
                title: const Text('Dashboard'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Iconsax.chart_2),
                title: const Text('Analytics'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Iconsax.profile_2user),
                title: const Text('Contacts'),
              ),
              ListTile(
                onTap: () {
                  // controller.box.remove('token');
                  // Get.offAllNamed('login');
                },
                leading: const Icon(Iconsax.logout),
                title: const Text('Logout'),
              ),
              const SizedBox(
                height: 50,
              ),
              Divider(color: Colors.grey.shade800),
              ListTile(
                onTap: () {
                  Get.toNamed('setting');
                },
                leading: const Icon(Iconsax.setting_2),
                title: const Text('Settings'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Iconsax.support),
                title: const Text('Support'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
