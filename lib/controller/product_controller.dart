import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:rahatak_food_vendor_app/data/api.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = <ProductData>[].obs;
  var selectedCategoryId = ''.obs;
  var totalProducts = 0.obs;
  RxList<PlatformFile> selectedImages = <PlatformFile>[].obs;

  // Controllers for Add/Edit dialogs
  static Rx<TextEditingController> mealNameController = TextEditingController().obs;
  static Rx<TextEditingController> mealDescriptionController = TextEditingController().obs;
  static Rx<TextEditingController> priceController = TextEditingController().obs;
  static Rx<TextEditingController> timeRequiredController = TextEditingController().obs;
  static RxInt selectSize = 0.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    try {
      isLoading(true);
      Map<String, String> headers = {
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };
      debugPrint('API: ${Api.allProduct(storeID: "${LocalStorage.getData(key: AppConstant.storeId)}")}');

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.allProduct(storeID: "${LocalStorage.getData(key: AppConstant.storeId)}"),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        ProductModel productModel = ProductModel.fromJson(responseBody);
        if (productModel.success == true && productModel.data != null) {
          products.assignAll(productModel.data!.data);
          totalProducts.value = productModel.data!.meta?.total ?? 0;
        } else {
          throw productModel.message ?? 'Failed to fetch products!';
        }
      } else {
        throw 'Failed to fetch products!';
      }
    } catch (e) {
      debugPrint('Error: $e');
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> addProduct({
    required String name,
    required String categoryId,
    required String description,
    required String price,
    required String timeRequired,
    required int selectedSize,
  }) async {
    try {
      isLoading(true);

      // Validate that all selected images are PNG
      for (var image in selectedImages) {
        if (image.path != null && await File(image.path!).exists()) {
          String? mimeType = lookupMimeType(image.path!);
          if (mimeType != 'image/png') {
            throw 'All images must be PNG format. Found invalid file: ${image.name}';
          }
        } else {
          throw 'Invalid image file: ${image.name}';
        }
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.products),
      );

      request.headers.addAll({
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'multipart/form-data',
      });
      debugPrint('API: ${Api.products}');
      debugPrint('Request Body (Data): $name, $description, $price, $timeRequired, $selectedSize');

      double parsedPrice = double.tryParse(price) ?? 0.0;
      int parsedTime = int.tryParse(timeRequired.split(' ')[0]) ?? 0;
      if (parsedPrice <= 0 || parsedTime <= 0) {
        throw 'Invalid price or time required';
      }

      List<Map<String, dynamic>> variations = [];
      if (selectedSize >= 0 && selectedSize <= 2) {
        variations.add({'size': 'small', 'price': parsedPrice});
        if (selectedSize >= 1) variations.add({'size': 'middle', 'price': parsedPrice * 1.2});
        if (selectedSize >= 2) variations.add({'size': 'large', 'price': parsedPrice * 1.5});
      }

      String jsonData = jsonEncode({
        'name': name,
        'category': categoryId,
        'description': description,
        'variations': variations,
        'time_required': parsedTime,
      });
      request.fields['data'] = jsonData;
      debugPrint('Request Body (JSON): $jsonData');

      for (var image in selectedImages) {
        if (image.path != null && await File(image.path!).exists()) {
          var file = File(image.path!);
          var multipartFile = await http.MultipartFile.fromPath(
            'images',
            file.path,
            filename: image.name,
          );
          request.files.add(multipartFile);
          debugPrint('Request Body (File): ${image.name}, Size: ${await file.length()} bytes, MIME Type: image/png');
        }
      }

      var response = await request.send().timeout(const Duration(seconds: 60));
      var responseBody = await http.Response.fromStream(response);
      debugPrint('Response Status: ${response.statusCode}');
      debugPrint('Response Body: ${responseBody.body}');

      dynamic jsonResponse = await BaseClient.handleResponse(responseBody);
      if (jsonResponse != null) {
        Get.back();
        String successMessage = jsonResponse['message'] ?? 'Product added successfully!'.tr;
        kSnackBar(
          message: successMessage,
          bgColor: AppColors.green,
        );
        selectedImages.clear();
        mealNameController.value.clear();
        mealDescriptionController.value.clear();
        priceController.value.clear();
        timeRequiredController.value.clear();
        selectSize.value = 0;
        await getProducts();
      } else {
        throw 'Failed to add product: No response data';
      }
    } catch (e) {
      debugPrint('Error: $e');
      kSnackBar(
        message: e is TimeoutException
            ? 'Request timed out. Check your network or server.'
            : e.toString(),
        bgColor: AppColors.red,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateProduct({
    required String productId,
    required String categoryId,
    required String name,
    required String description,
    required String price,
    required String timeRequired,
    required int selectedSize,
  }) async {
    try {
      isLoading(true);

      // Validate that all selected images are PNG
      for (var image in selectedImages) {
        if (image.path != null && await File(image.path!).exists()) {
          String? mimeType = lookupMimeType(image.path!);
          if (mimeType != 'image/png') {
            throw 'All images must be PNG format. Found invalid file: ${image.name}';
          }
        } else {
          throw 'Invalid image file: ${image.name}';
        }
      }

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(Api.productApi(productId: productId)),
      );

      request.headers.addAll({
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'multipart/form-data',
      });
      debugPrint('API: ${Api.productApi(productId: productId)}');
      debugPrint('Request Body (Data): $name, $description, $price, $timeRequired, $selectedSize');

      double parsedPrice = double.tryParse(price) ?? 0.0;
      int parsedTime = int.tryParse(timeRequired.split(' ')[0]) ?? 0;
      if (parsedPrice <= 0 || parsedTime <= 0) {
        throw 'Invalid price or time required';
      }

      List<Map<String, dynamic>> variations = [];
      if (selectedSize >= 0 && selectedSize <= 2) {
        variations.add({'size': 'small', 'price': parsedPrice});
        if (selectedSize >= 1) variations.add({'size': 'middle', 'price': parsedPrice * 1.2});
        if (selectedSize >= 2) variations.add({'size': 'large', 'price': parsedPrice * 1.5});
      }

      String jsonData = jsonEncode({
        'name': name,
        'category': categoryId,
        'description': description,
        'variations': variations,
        'time_required': parsedTime,
      });
      request.fields['data'] = jsonData;
      debugPrint('Request Body (JSON): $jsonData');

      for (var image in selectedImages) {
        if (image.path != null && await File(image.path!).exists()) {
          var file = File(image.path!);
          var multipartFile = await http.MultipartFile.fromPath(
            'images',
            file.path,
            filename: image.name,
          );
          request.files.add(multipartFile);
          debugPrint('Request Body (File): ${image.name}, Size: ${await file.length()} bytes, MIME Type: image/png');
        }
      }

      var response = await request.send().timeout(const Duration(seconds: 60));
      var responseBody = await http.Response.fromStream(response);
      debugPrint('Response Status: ${response.statusCode}');
      debugPrint('Response Body: ${responseBody.body}');

      dynamic jsonResponse = await BaseClient.handleResponse(responseBody);
      if (jsonResponse != null) {
        Get.back();
        String successMessage = jsonResponse['message'] ?? 'Product updated successfully!'.tr;
        kSnackBar(
          message: successMessage,
          bgColor: AppColors.green,
        );
        selectedImages.clear();
        mealNameController.value.clear();
        mealDescriptionController.value.clear();
        priceController.value.clear();
        timeRequiredController.value.clear();
        selectSize.value = 0;
        await getProducts();
      } else {
        throw 'Failed to update product: No response data';
      }
    } catch (e) {
      debugPrint('Error: $e');
      kSnackBar(
        message: e is TimeoutException
            ? 'Request timed out. Check your network or server.'
            : e.toString(),
        bgColor: AppColors.red,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      isLoading(true);
      Map<String, String> headers = {
        'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };
      debugPrint('API: ${Api.productApi(productId: productId)}');

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.deleteRequest(
          api: Api.productApi(productId: productId),
         // headers: headers, // Fixed: Uncommented to ensure authentication
        ),
      );

      if (responseBody != null) {
        Get.back();
        String successMessage = responseBody['message'] ?? 'Product deleted successfully!'.tr;
        kSnackBar(
          message: successMessage,
          bgColor: AppColors.green,
        );
        await getProducts();
      } else {
        throw 'Failed to delete product: No response data';
      }
    } catch (e) {
      debugPrint('Error: $e');
      kSnackBar(
        message: e is TimeoutException
            ? 'Request timed out. Check your network or server.'
            : e.toString(),
        bgColor: AppColors.red,
      );
    } finally {
      isLoading(false);
    }
  }
}