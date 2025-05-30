import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/screen/login_screen.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/assets_utils/screen_utils.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../data/api.dart';
import '../screen/home_screen.dart';
import '../utils/assets_utils/color_utils.dart';
import '../utils/assets_utils/image_path_utils.dart';
import '../utils/widget_utils/spacer_widget.dart';

class RegistrationController extends GetxController {
  var isLoading = false.obs;

  Future<void> register({
    required String email,
    required String password,
    required String storeName,
    required String contact,
    required String bankAccount,
    required String governorate,
    required String state,
    required String locationLink,
  }) async {
    try {
      isLoading(true);
      final map = {
        "email": email.toLowerCase(),
        "password": password,
        "store_name": storeName,
        "store_description": "Top-rated local kitchen in the heart of ${governorate.capitalizeFirst}.",
        "contact": contact,
        "bank_account": bankAccount,
        "locations": [
          {
            "governorate": governorate,
            "state": state,
            "location_link": locationLink,
            "location": {
              "type": "Point",
              "coordinates": [58.3829, 23.5880] // Hardcoded as per provided example
            }
          }
        ]
      };

      final headers = {
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.signup,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
       // final accessToken = responseBody['data']['accessToken'].toString();
      //  print("accessToken: $accessToken");
      //  LocalStorage.saveData(key: AppConstant.token, data: accessToken);
        showAdaptiveDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height > 1000 ? 406.vpmt(context) : 251.vpmm(context),
                horizontal: MediaQuery.sizeOf(context).width > 500 ? 158.hpmt(context) : 16.hpmm(context),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width > 500 ? 414.wt(context) : 358.wm(context),
                height: MediaQuery.sizeOf(context).height > 1000 ? 247.ht(context) : 303.hm(context),
                decoration: BoxDecoration(
                  color: ColorUtils.white255,
                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 16.rt(context) : 16.rm(context)),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height > 1000 ? 30.vpmt(context) : 30.vpmm(context),
                  horizontal: MediaQuery.sizeOf(context).width > 500 ? 20.hpmt(context) : 20.hpmm(context),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 64.ht(context) : 64.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 64.wt(context) : 64.wm(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                          ImagePathUtils.signUpScreenImagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 18.ht(context) : 18.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 428.wt(context) : 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "Your account has been created successfully!".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 18.spm(context),
                          color: ColorUtils.black33,
                          height: MediaQuery.sizeOf(context).height > 1000 ? (35.ht(context) / 18.spt(context)) : (35.hm(context) / 18.spm(context)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 428.wt(context) : 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "You can now log in and start ordering your favorite meals with ease.".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                          height: MediaQuery.sizeOf(context).height > 1000 ? (35.ht(context) / 18.spt(context)) : (35.hm(context) / 16.spm(context)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        Get.back();
        Get.offAll(() => LoginScreen(), duration: Duration(milliseconds: 300), transition: Transition.fadeIn);
      } else {
        throw 'Registration Failed!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}