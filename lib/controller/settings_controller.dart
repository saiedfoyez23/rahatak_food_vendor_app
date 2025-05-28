import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../model/settings_model.dart';

class SettingsController extends GetxController {
  var isLoading = false.obs;
  var settingsData = <SettingsData>[].obs;
  var termsAndConditions = ''.obs;

  @override
  void onInit() {
    getSettings();
    super.onInit();
  }

  Future<void> getSettings() async {
    try {
      isLoading(true);

      Map<String, String> headers = {
        'Authorization': "${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: 'http://192.168.10.43:5010/api/v1/settings',
          headers: headers,
        ),
      );

      if (responseBody != null) {
        SettingsModel settingsModel = SettingsModel.fromJson(responseBody);
        if (settingsModel.success == true) {
          settingsData.assignAll(settingsModel.data);
          termsAndConditions.value = settingsData.isNotEmpty
              ? settingsModel.data.first.termsConditions ?? 'No terms and conditions available.'
              : 'No terms and conditions available.';
        } else {
          throw settingsModel.message ?? 'Failed to fetch settings!';
        }
      } else {
        throw 'Failed to fetch settings!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}