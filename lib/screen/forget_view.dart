import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/forget_controller.dart';
import '../utils/app_color/app_colors.dart';
import '../utils/app_text_style/styles.dart';
import '../utils/size_box/custom_sizebox.dart';
import '../utils/widget_utils/custom_main_button.dart';
import '../utils/widget_utils/custom_textfelid.dart';
import '../widget/custom_snackbar.dart';


class ForgotView extends GetView {
   ForgotView({super.key});

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
                "Forgot your password?".tr,
                style: h2,
              ),
            ),
            sh10,
            Center(
              child: Text(
                "Enter your registered email address, and we will send you a link to reset your password.".tr,
                style: h3,
                textAlign: TextAlign.center,
              ),
            ),
            sh10,
            CustomTextField(
              title: "Email address".tr,
              width: Get.width,
              hintText: "Enter your email".tr,
              controller: controller.emailController,
            ),
            sh20,
            Obx(() => CustomButton(
              ontap: controller.isLoading.value
                  ? null
                  : () {
                if (controller.emailController.text.isEmpty) {
                  kSnackBar(
                    message: "Please enter your email".tr,
                    bgColor: AppColors.red,
                  );
                  return;
                }
                controller.sendOtp(email: controller.emailController.text);
              },
              title: controller.isLoading.value ? "Sending...".tr : "Send".tr,
              width: Get.width,
            )),
          ],
        ),
      ),
    );
  }
}