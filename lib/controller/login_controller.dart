import 'dart:convert';

import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';

import '../data/api.dart';
import '../screen/home_screen.dart';

class LoginController extends GetxController{
  var isLoading = false.obs;

  Future<void> login({
    required String email,
    required String password,
  }) async {
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
          api: Api.login,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {

        final accessToken = responseBody['data']['accessToken'].toString();

        print("accessToken: $accessToken");
        LocalStorage.saveData(key: AppConstant.token, data: accessToken);

        Get.offAll(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn);
      } else {
        throw 'Login Failed!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}