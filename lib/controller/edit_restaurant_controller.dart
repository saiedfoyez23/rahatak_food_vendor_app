import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rahatak_food_vendor_app/controller/profile_data_controller.dart';
import 'package:rahatak_food_vendor_app/data/api.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';

class EditRestaurantController extends GetxController {

  final ProfileDataController profileController = Get.put(ProfileDataController());

  final restaurantNameController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final emailAddressController = TextEditingController().obs;
  final bankAccountController = TextEditingController().obs;
  var isLoading = false.obs;

  @override
  void onClose() {
    restaurantNameController.value.dispose();
    phoneNumberController.value.dispose();
    emailAddressController.value.dispose();
    bankAccountController.value.dispose();
    super.onClose();
  }

  Future<void> save() async {
    try {
      isLoading(true);
      print("🟡 Sending vendor update request");

      // Prepare the body, only include fields that are not empty
      final Map<String, String> body = {};
      if (restaurantNameController.value.text.isNotEmpty) {
        body['store_name'] = restaurantNameController.value.text;
      }
      if (phoneNumberController.value.text.isNotEmpty) {
        body['contact'] = phoneNumberController.value.text;
      }
      if (bankAccountController.value.text.isNotEmpty) {
        body['bank_account'] = bankAccountController.value.text;
      }

      if (body.isEmpty) {
        kSnackBar(
          message: 'Please fill at least one field to update.'.tr,
          bgColor: AppColors.red,
        );
        return;
      }

      print("➡️ Request body: ${jsonEncode(body)}");

      // Make the PUT request
      final response = await http.put(
        Uri.parse(Api.vendorUpdate),
        headers: {
          'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(const Duration(seconds: 30));

      print("✅ Server responded with status: ${response.statusCode}");
      print("📦 Response body: ${response.body}");

      // Handle response using BaseClient
      dynamic jsonResponse = await BaseClient.handleResponse(response);
      if (jsonResponse != null) {
        await profileController.getProfile();
        Get.back();
        String successMessage = jsonResponse['message'] ?? 'Vendor updated successfully!'.tr;
        print("✅ Success message: $successMessage");
        kSnackBar(
          message: successMessage,
          bgColor: AppColors.green,
        );

      } else {
        throw 'Failed to update vendor: No response data';
      }
    } catch (e) {
      print("❌ Failed to update vendor: $e");
      kSnackBar(
        message: 'Failed to update vendor: $e',
        bgColor: AppColors.red,
      );
    } finally {
      isLoading(false);
    }
  }

  void cancel() {
    Get.back(); // Close dialog without saving
  }
}
