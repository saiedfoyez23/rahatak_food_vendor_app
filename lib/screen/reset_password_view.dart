import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/forget_controller.dart';
import '../utils/app_color/app_colors.dart';
import '../utils/app_text_style/styles.dart';

import '../utils/size_box/custom_sizebox.dart';
import '../utils/widget_utils/custom_main_button.dart';
import '../utils/widget_utils/custom_textfelid.dart';
import '../widget/custom_snackbar.dart';


class ResetPasswordView extends GetView {
  final String email;
   ResetPasswordView({super.key, required this.email});
  final ForgetController controller = Get.put(ForgetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: AppColors.mainColor,
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 14,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Enter new password".tr,
                style: h2.copyWith(fontSize: 24),
              ),
            ),
            sh10,
            Text(
              "Create a new password to secure your account.".tr,
              style: h3,
              textAlign: TextAlign.center,
            ),
            sh10,
            CustomTextField(
              title: "New password".tr,
              width: Get.width,
              hintText: "Enter new password".tr,
              controller: controller.newPasswordController,

            ),
            sh10,
            CustomTextField(
              title: "Confirm Password".tr,
              width: Get.width,
              hintText: "Enter confirm password".tr,
              controller: controller.confirmPasswordController,

            ),
            sh20,
            Obx(() => CustomButton(
              ontap: controller.isLoading.value
                  ? null
                  : () {
                if (controller.newPasswordController.text.isEmpty ||
                    controller.confirmPasswordController.text.isEmpty) {
                  kSnackBar(
                    message: "Please fill in both password fields".tr,
                    bgColor: AppColors.red,
                  );
                  return;
                }
                if (controller.newPasswordController.text !=
                    controller.confirmPasswordController.text) {
                  kSnackBar(
                    message: "Passwords do not match".tr,
                    bgColor: AppColors.red,
                  );
                  return;
                }
                if (controller.newPasswordController.text.length < 8) {
                  kSnackBar(
                    message: "Password must be at least 8 characters".tr,
                    bgColor: AppColors.red,
                  );
                  return;
                }
                controller.resetPassword(
                  email: email,
                  password: controller.newPasswordController.text,
                );
              },
              title: controller.isLoading.value ? "Updating...".tr : "Update Password".tr,
              width: Get.width,

            )),
          ],
        ),
      ),
    );
  }
}