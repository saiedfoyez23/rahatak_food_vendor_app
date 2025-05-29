import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rahatak_food_vendor_app/data/api.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';

class SupportController extends GetxController {
  var isLoading = false.obs;

  Future<void> sendSupportRequest({
    required String message,
    required File image,
  }) async {
    try {
      isLoading(true);

      print("🟡 Sending support request");
      print("➡️ Message: $message");
      print("➡️ Image path: ${image.path}");
      print("➡️ File exists: ${await image.exists()}");

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.supports),
      );

      // Headers
      String token = LocalStorage.getData(key: AppConstant.token);
      request.headers.addAll({
        'Authorization': "Bearer $token",
      });

      print("➡️ Headers: ${request.headers}");

      // JSON field
      String jsonData = jsonEncode({"message": message});
      request.fields['data'] = jsonData;
      print("➡️ Field [data]: $jsonData");

      // File
      // if (await image.exists()) {
      //   final fileLength = await image.length();
      //   print("➡️ Image file size: $fileLength bytes");
      //   var multipartFile = http.MultipartFile(
      //     'image',
      //     image.readAsBytes().asStream(),
      //     fileLength,
      //     filename: image.path.split('/').last,
      //   );
      //   request.files.add(multipartFile);
      //   print("✅ Image file added to request");
      // } else {
      //   print("❌ Image file does not exist");
      // }

      // Send request
      var response = await request.send().timeout(const Duration(seconds: 30));
      var responseBody = await http.Response.fromStream(response);

      print("✅ Server responded with status: ${response.statusCode}");
      print("📦 Response body: ${responseBody.body}");

      dynamic jsonResponse = await BaseClient.handleResponse(responseBody);
      if (jsonResponse != null) {
        kSnackBar(
          message: jsonResponse['message'] ?? 'Support request sent successfully!'.tr,
          bgColor: AppColors.green,
        );
      } else {
        throw 'Failed to send support request!';
      }
    } catch (e) {
      print("❌ Request failed: $e");
      kSnackBar(message: 'Request failed: $e', bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}
