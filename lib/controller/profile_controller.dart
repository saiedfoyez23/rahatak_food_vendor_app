import 'package:get/get.dart';
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

  Future<void> getProfile() async {
    try {
      isLoading(true);

      Map<String, String> headers = {
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: 'http://192.168.10.43:5010/api/v1/vendors/profile',
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("full body: $responseBody");
        profile.value = ProfileModel.fromJson(responseBody);
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