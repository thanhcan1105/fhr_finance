




// MyTextInput(
//                       hintText: 'Họ tên'.tr,
//                       iconData: Icons.supervised_user_circle,
//                       controller: controller.fullNameController,
//                       validateCallback: (v) {
//                         controller.isValidateFullName.value = v;
//                         controller.formValidate();
//                       },
//                       rules: {
//                         'minLength': 6,
//                         'required': 'Vui lòng nhập họ tên',
//                         // 'username': 'xxxx',
//                       },
//                     ),


// MyTextInput(
//                       hintText: 'Số điện thoại'.tr,
//                       iconData: Icons.phone,
//                       controller: controller.phoneNunberController,
//                       validateCallback: (v) {
//                         controller.isValidatePhoneNumber.value = v;
//                         controller.formValidate();
//                       },
//                       rules: {
//                         'minLength': 6,
//                         'required': 'Vui lòng nhập số điện thoại',
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     MyTextInput(
//                       hintText: 'CMND/CCCD'.tr,
//                       iconData: Icons.perm_identity,
//                       controller: controller.cardIdController,
//                       validateCallback: (v) {
//                         controller.isValidateCardId.value = v;
//                         controller.formValidate();
//                       },
//                       rules: {
//                         'minLength': 6,
//                         'required': 'Vui lòng nhập cmnd hoặc cccd',
//                       },
//                     ),

// Obx(
//                       () => MyButtonSubmit(
//                         label: 'login_sign_up'.tr.toUpperCase(),
//                         submiting: controller.isSubmitting.value,
//                         onPressed: !controller.isEnableSubmit.value
//                             ? null
//                             : () {
//                                 controller.handleRegister();
//                               },
//                       ),
//                     ),