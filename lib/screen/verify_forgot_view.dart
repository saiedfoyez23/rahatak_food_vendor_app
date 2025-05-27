import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controller/forget_controller.dart';
import '../utils/app_color/app_colors.dart';
import '../utils/app_text_style/styles.dart';
import '../utils/size_box/custom_sizebox.dart';
import '../utils/widget_utils/custom_main_button.dart';
import '../widget/custom_snackbar.dart';


class VerifyForgotView extends GetView {
  final String email;
   VerifyForgotView({super.key, required this.email});
  final ForgetController controller = Get.put(ForgetController());

  @override
  Widget build(BuildContext context) {
    final RxInt countdown = 60.obs;
    final RxBool isButtonVisible = false.obs;

    void startCountdown() {
      isButtonVisible.value = false;
      countdown.value = 60;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (countdown.value > 0) {
          countdown.value--;
        } else {
          timer.cancel();
          isButtonVisible.value = true;
        }
      });
    }

    startCountdown(); // Start countdown on widget load

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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh50,
              Text("Code has been sent to $email".tr, style: h3),
              sh20,
              PinCodeTextField(
                controller: controller.otpController,
                autoDisposeControllers: false,
                cursorColor: AppColors.white,
                appContext: context,
                textStyle: h2,
                autoFocus: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 45,
                  fieldWidth: 46,
                  activeFillColor: AppColors.transparent,
                  selectedFillColor: AppColors.mainColor.withOpacity(0.2),
                  inactiveFillColor: AppColors.mainColor.withOpacity(0.2),
                  borderWidth: 0.5,
                  selectedColor: AppColors.white,
                  activeColor: AppColors.white,
                  inactiveColor: AppColors.white,
                ),
                length: 6,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.disabled,
                enableActiveFill: true,
              ),
              sh20,
              Obx(() => Text(
                countdown.value > 0
                    ? "Resend code in ${countdown.value} s".tr
                    : "",
                style: h2,
              )),
              Obx(() => isButtonVisible.value
                  ? GestureDetector(
                onTap: () {
                  controller.resendOtp(email: email);
                  startCountdown();
                },
                child: Text("Resend".tr, style: h2),
              )
                  : const SizedBox.shrink()),
              sh50,
              Obx(() => CustomButton(
                ontap: controller.isLoading.value
                    ? null
                    : () {
                  if (controller.otpController.text.length != 6) {
                    kSnackBar(
                      message: "Please enter a 6-digit OTP".tr,
                      bgColor: AppColors.red,
                    );
                    return;
                  }
                  controller.verifyOtp(
                    email: email,
                    otp: controller.otpController.text,
                  );
                },
                title: controller.isLoading.value ? "Verifying...".tr : "Confirm".tr,
                width: Get.width,

              )),
            ],
          ),
        ),
      ),
    );
  }
}