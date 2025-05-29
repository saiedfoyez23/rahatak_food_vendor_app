import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../model/notification_model.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notifications = <NotificationData>[].obs;
  var totalNotifications = 0.obs;

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  Future<void> getNotifications() async {
    try {
      isLoading(true);
      Map<String, String> headers = {
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };
      const String notificationApi = 'http://192.168.10.43:5010/api/v1/notifications';
      debugPrint('API: $notificationApi');

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: notificationApi,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        NotificationModel notificationModel = NotificationModel.fromJson(responseBody);
        if (notificationModel.success == true && notificationModel.data != null) {
          notifications.assignAll(notificationModel.data!.data);
          totalNotifications.value = notificationModel.data!.meta?.total ?? 0;
          debugPrint('Fetched ${notifications.length} notifications');
        } else {
          throw notificationModel.message ?? 'Failed to fetch notifications!';
        }
      } else {
        throw 'Failed to fetch notifications!';
      }
    } catch (e) {
      debugPrint('Error: $e');
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}