import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahatak_food_vendor_app/data/api.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profile = ProfileModel().obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  //time
  var startTime = Rxn<TimeOfDay>(); // Nullable reactive start time
  var endTime = Rxn<TimeOfDay>(); // Nullable reactive end time

  // Function to pick start time
  Future<void> pickStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      startTime.value = picked;
    }
  }

  // Function to pick end time
  Future<void> pickEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      endTime.value = picked;
    }
  }


  //image picker
  var selectedImage = Rxn<File>(); // Nullable reactive File for the selected image

  // Function to pick an image from gallery
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }



  Future<void> getProfile() async {
    try {
      isLoading(true);

      Map<String, String> headers = {
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.profile,
          headers: headers,
        ),
      );

      if (responseBody != null) {

        profile.value = ProfileModel.fromJson(responseBody);
        LocalStorage.saveData(key: AppConstant.storeId, data: profile.value.data?.store?.id);
        LocalStorage.saveData(key: AppConstant.vendorId, data: profile.value.data?.id);
        print("ID::: ${LocalStorage.getData(key: AppConstant.storeId)}");
        print("Vendor ID::: ${LocalStorage.getData(key: AppConstant.storeId)}");
      } else {
        throw 'Failed to fetch profile!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}