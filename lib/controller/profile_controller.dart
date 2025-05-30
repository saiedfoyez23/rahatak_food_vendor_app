import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:rahatak_food_vendor_app/data/api.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../controller/category_controller.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  final CategoryController categoryController; // Injected via constructor
  var isLoading = false.obs;
  var profile = Rx<ProfileModel?>(null);

  // Image states
  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<File?> selectedCover = Rx<File?>(null);

  // Text controllers
  Rx<TextEditingController> restaurantNameController = TextEditingController().obs;
  Rx<TextEditingController> emailAddressController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> bankAccountController = TextEditingController().obs;
  Rx<TextEditingController> governorateController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> locationLinkController = TextEditingController().obs;
  Rx<TextEditingController> startTimeController = TextEditingController().obs;
  Rx<TextEditingController> endTimeController = TextEditingController().obs;
  Rx<TextEditingController> restaurantClassificationController = TextEditingController().obs;
  Rx<TextEditingController> workingHoursController = TextEditingController().obs;

  // Password controllers
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> currentPasswordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool obscureText = true.obs;
  RxBool currentObscureText = true.obs;
  RxBool confirmObscureText = true.obs;

  // Language states
  RxBool isEnglish = false.obs;
  RxBool isArabic = false.obs;

  // Time pickers
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> endTime = Rx<TimeOfDay?>(null);

  // Constructor to inject CategoryController
  ProfileController({required this.categoryController});

  @override
  void onInit() {
    super.onInit();
    // Fetch profile data when the controller is initialized
    getProfile();
  }

  // Fetch profile data from the API
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
        LocalStorage.saveData(key: AppConstant.storeId, data: profile.value!.data?.store?.id);
        LocalStorage.saveData(key: AppConstant.vendorId, data: profile.value!.data?.id);
        print("ID::: ${LocalStorage.getData(key: AppConstant.storeId)}");
        print("Vendor ID::: ${LocalStorage.getData(key: AppConstant.vendorId)}");

        // Populate text controllers after fetching profile data
        if (profile.value != null && profile.value!.data != null) {
          restaurantNameController.value.text = profile.value!.data!.store?.name ?? '';
          emailAddressController.value.text = profile.value!.data!.email ?? '';
          phoneNumberController.value.text = profile.value!.data!.store?.contact ?? '';
          bankAccountController.value.text = profile.value!.data!.bankAccount ?? '';
          governorateController.value.text = profile.value!.data!.store!.locations.isNotEmpty
              ? profile.value!.data!.store!.locations.first.governorate ?? ''
              : '';
          stateController.value.text = profile.value!.data!.store!.locations.isNotEmpty
              ? profile.value!.data!.store!.locations.first.state ?? ''
              : '';
          locationLinkController.value.text = profile.value!.data!.store!.locations.isNotEmpty
              ? profile.value!.data!.store!.locations.first.locationLink ?? ''
              : '';
          startTimeController.value.text = profile.value!.data!.store!.workingHours.isNotEmpty
              ? profile.value!.data!.store!.workingHours.first.from ?? ''
              : '';
          endTimeController.value.text = profile.value!.data!.store!.workingHours.isNotEmpty
              ? profile.value!.data!.store!.workingHours.first.to ?? ''
              : '';
          restaurantClassificationController.value.text = profile.value!.data!.store!.categories.isNotEmpty
              ? profile.value!.data!.store!.categories.first.name ?? ''
              : '';
          workingHoursController.value.text = profile.value!.data!.store!.workingHours.isNotEmpty
              ? profile.value!.data!.store!.workingHours.map((wh) => '${wh.from} - ${wh.to}').join(', ')
              : '';
        }
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

  // Function to pick an image from gallery
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = File(image.path);
    } else {
      kSnackBar(message: 'No image selected', bgColor: AppColors.red);
    }
  }

  // Function to pick a cover image from gallery
  Future<void> pickCover() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedCover.value = File(image.path);
    } else {
      kSnackBar(message: 'No cover image selected', bgColor: AppColors.red);
    }
  }

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
      startTimeController.value.text = picked.format(context);
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
      endTimeController.value.text = picked.format(context);
    }
  }

  // Update profile data
  Future<void> updateProfile() async {
    try {
      isLoading(true);

      // Validate images
      if (selectedImage.value != null) {
        String? mimeType = lookupMimeType(selectedImage.value!.path);
        if (mimeType != 'image/png') {
          throw 'Profile image must be PNG format';
        }
      }
      if (selectedCover.value != null) {
        String? mimeType = lookupMimeType(selectedCover.value!.path);
        if (mimeType != 'image/png') {
          throw 'Cover image must be PNG format';
        }
      }

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(Api.updateStore(storeID: "${LocalStorage.getData(key: AppConstant.storeId)}")),
      );

      request.headers.addAll({
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'multipart/form-data',
      });

      // Prepare data
      String jsonData = jsonEncode({
        "locations": [
          {
            "governorate": governorateController.value.text,
            "state": stateController.value.text,
            "location_link": locationLinkController.value.text,
          }
        ],
        "working_hours": [
          {"from": startTimeController.value.text, "to": endTimeController.value.text},
          {"from": "10:00", "to": "22:00"} // Additional default hours
        ],
        "categories": categoryController.categoryNames.map((name) => "648a2bc8f0f1b81234e8cd90").toList(),
      });
      request.fields['data'] = jsonData;

      // Add images
      if (selectedImage.value != null) {
        var imageFile = selectedImage.value!;
        var multipartFile = await http.MultipartFile.fromPath('image', imageFile.path, filename: 'profile.png');
        request.files.add(multipartFile);
      }
      if (selectedCover.value != null) {
        var coverFile = selectedCover.value!;
        var multipartFile = await http.MultipartFile.fromPath('cover', coverFile.path, filename: 'cover.png');
        request.files.add(multipartFile);
      }

      var response = await request.send().timeout(const Duration(seconds: 60));
      var responseBody = await http.Response.fromStream(response);

      dynamic jsonResponse = await BaseClient.handleResponse(responseBody);
      if (jsonResponse != null) {
        kSnackBar(message: jsonResponse['message'] ?? 'Profile updated successfully!', bgColor: AppColors.green);
        // Refresh profile data after update
        await getProfile();
      } else {
        throw 'Failed to update profile: No response data';
      }
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}