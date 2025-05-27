import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/data/api.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../screen/verify_forgot_view.dart';
import '../screen/reset_password_view.dart';
import '../screen/login_screen.dart';
import '../utils/size_box/custom_sizebox.dart';

class ForgetController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> sendOtp({required String email}) async {
    try {
      isLoading(true);
      final map = {
        "email": email.toLowerCase(),
      };

      final headers = {
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.sendOtp,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        Get.to(() => VerifyForgotView(email: email));
      } else {
        throw 'Failed to send OTP!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    try {
      isLoading(true);
      final map = {
        "email": email.toLowerCase(),
        "otp": otp,
      };

      final headers = {
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.verifyOtp,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        Get.to(() => ResetPasswordView(email: email));
      } else {
        throw 'OTP verification failed!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> resendOtp({required String email}) async {
    await sendOtp(email: email);
  }

  Future<void> resetPassword({required String email, required String password}) async {
    try {
      isLoading(true);
      final map = {
        "email": email.toLowerCase(),
        "password": password,
      };

      final headers = {
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.resetPassword,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        Get.dialog(
          Dialog(
            child: Container(
              height: 300,
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: AppColors.green, size: 40),
                  sh10,
                  Text(
                    "Your password has been updated!".tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "You can now log in with your new password.".tr,
                    style: TextStyle(color: AppColors.black),
                    textAlign:  TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
        Future.delayed(const Duration(seconds: 5), () => Get.offAll(() => LoginScreen()));
      } else {
        throw 'Failed to reset password!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}