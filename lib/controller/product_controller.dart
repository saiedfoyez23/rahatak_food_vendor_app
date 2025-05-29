import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
    int attempts = 0;
    const int retryCount = 3;
    while (attempts < retryCount) {
      try {
        isLoading(true);
        print("🟡 Attempt ${attempts + 1}: Fetching products");

        Map<String, String> headers = {
          'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
          'Content-Type': 'application/json',
        };

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
            print("✅ Fetched ${products.length} products");
            return;
          } else {
            throw productModel.message ?? 'Failed to fetch products!';
          }
        } else {
          throw 'Failed to fetch products!';
        }
      } catch (e) {
        attempts++;
        print("❌ Attempt $attempts failed: $e");
        if (attempts == retryCount) {
          kSnackBar(message: e.toString(), bgColor: AppColors.red);
        } else {
          print("🔄 Retrying in 2 seconds...");
          await Future.delayed(const Duration(seconds: 2));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required String timeRequired,
    required int selectedSize,
  }) async {
    int attempts = 0;
    const int retryCount = 3;
    while (attempts < retryCount) {
      try {
        isLoading(true);
        print("🟡 Attempt ${attempts + 1}: Adding new product");

        var request = http.MultipartRequest(
          'POST',
          Uri.parse(Api.products),
        );

        // Headers
        request.headers.addAll({
          'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
          'Content-Type': 'multipart/form-data',
        });

        // Validate inputs
        double parsedPrice = double.tryParse(price) ?? 0.0;
        int parsedTime = int.tryParse(timeRequired.split(' ')[0]) ?? 0;
        if (parsedPrice <= 0 || parsedTime <= 0) {
          throw 'Invalid price or time required';
        }

        // Prepare variations based on selected size
        List<Map<String, dynamic>> variations = [];
        if (selectedSize >= 0 && selectedSize <= 2) {
          variations.add({'size': 'small', 'price': parsedPrice});
          if (selectedSize >= 1) variations.add({'size': 'middle', 'price': parsedPrice * 1.2});
          if (selectedSize >= 2) variations.add({'size': 'large', 'price': parsedPrice * 1.5});
        }

        // Data field
        String jsonData = jsonEncode({
          'name': name,
          'category': '682711ceb765318af80f5ecd',
          'description': description,
          'variations': variations,
          'time_required': parsedTime,
        });
        request.fields['data'] = jsonData;
        print("➡️ Data field: $jsonData");

        // Add images
        for (var image in selectedImages) {
          if (image.path != null && await File(image.path!).exists()) {
            var multipartFile = http.MultipartFile(
              'images',
              File(image.path!).readAsBytes().asStream(),
              await File(image.path!).length(),
              filename: image.name,
            );
            request.files.add(multipartFile);
            print("✅ Added image: ${image.name}");
          }
        }

        // Send request
        var response = await request.send().timeout(const Duration(seconds: 30));
        var responseBody = await http.Response.fromStream(response);
        print("✅ Server responded with status: ${response.statusCode}");
        print("📦 Response body: ${responseBody.body}");

        dynamic jsonResponse = await BaseClient.handleResponse(responseBody);
        if (jsonResponse != null) {

          String successMessage = jsonResponse['message'] ?? 'Product added successfully!'.tr;
          print("✅ Success message: $successMessage");
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

          await getProducts(); // Refresh product list
          return;
        } else {
          throw 'Failed to add product: No response data';
        }
      } catch (e) {
        attempts++;
        print("❌ Attempt $attempts failed: $e");
        if (attempts == retryCount) {
          kSnackBar(
            message: 'Failed after $retryCount attempts: $e',
            bgColor: AppColors.red,
          );
        } else {
          print("🔄 Retrying in 2 seconds...");
          await Future.delayed(const Duration(seconds: 2));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> updateProduct({
    required String productId,
    required String name,
    required String description,
    required String price,
    required String timeRequired,
    required int selectedSize,
  }) async {
    int attempts = 0;
    const int retryCount = 3;
    while (attempts < retryCount) {
      try {
        isLoading(true);
        print("🟡 Attempt ${attempts + 1}: Updating product $productId");

        var request = http.MultipartRequest(
          'PUT',
          Uri.parse(Api.productApi(productId: productId)),
        );

        // Headers
        request.headers.addAll({
          'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
          'Content-Type': 'multipart/form-data',
        });

        // Validate inputs
        double parsedPrice = double.tryParse(price) ?? 0.0;
        int parsedTime = int.tryParse(timeRequired.split(' ')[0]) ?? 0;
        if (parsedPrice <= 0 || parsedTime <= 0) {
          throw 'Invalid price or time required';
        }

        // Prepare variations based on selected size
        List<Map<String, dynamic>> variations = [];
        if (selectedSize >= 0 && selectedSize <= 2) {
          variations.add({'size': 'small', 'price': parsedPrice});
          if (selectedSize >= 1) variations.add({'size': 'middle', 'price': parsedPrice * 1.2});
          if (selectedSize >= 2) variations.add({'size': 'large', 'price': parsedPrice * 1.5});
        }

        // Data field
        String jsonData = jsonEncode({
          'name': name,
          'category': '682711ceb765318af80f5ecd',
          'description': description,
          'variations': variations,
          'time_required': parsedTime,
        });
        request.fields['data'] = jsonData;
        print("➡️ Data field: $jsonData");
        print("➡️ Request URL: ${Api.productApi(productId: productId)}"); // Debug URL

        // Add images if any
        for (var image in selectedImages) {
          if (image.path != null && await File(image.path!).exists()) {
            var multipartFile = http.MultipartFile(
              'images',
              File(image.path!).readAsBytes().asStream(),
              await File(image.path!).length(),
              filename: image.name,
            );
            request.files.add(multipartFile);
            print("✅ Added image: ${image.name}");
          }
        }

        // Send request
        var response = await request.send().timeout(const Duration(seconds: 60)); // Increased timeout to 60 seconds
        var responseBody = await http.Response.fromStream(response);
        print("✅ Server responded with status: ${response.statusCode}");
        print("📦 Response body: ${responseBody.body}");

        dynamic jsonResponse = await BaseClient.handleResponse(responseBody);
        if (jsonResponse != null) {
          Get.back();
          String successMessage = jsonResponse['message'] ?? 'Product updated successfully!'.tr;
          print("✅ Success message: $successMessage");
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

          await getProducts(); // Refresh product list
          return;
        } else {
          throw 'Failed to update product: No response data';
        }
      } catch (e) {
        attempts++;
        print("❌ Attempt $attempts failed: $e");
        if (attempts == retryCount) {
          kSnackBar(
            message: e is TimeoutException
                ? 'Request timed out after $retryCount attempts. Check your network or server.'
                : 'Failed after $retryCount attempts: $e',
            bgColor: AppColors.red,
          );
        } else {
          print("🔄 Retrying in 2 seconds...");
          await Future.delayed(const Duration(seconds: 2));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> deleteProduct(String productId) async {
    int attempts = 0;
    const int retryCount = 3;
    while (attempts < retryCount) {
      try {
        isLoading(true);
        print("🟡 Attempt ${attempts + 1}: Deleting product $productId");

        Map<String, String> headers = {
          'Authorization': "Bearer ${LocalStorage.getData(key: AppConstant.token)}",
          'Content-Type': 'application/json',
        };

        dynamic responseBody = await BaseClient.handleResponse(
          await BaseClient.deleteRequest(
            api: Api.productApi(productId: productId),

          ),
        );

        if (responseBody != null) {
          Get.back();
          String successMessage = responseBody['message'] ?? 'Product deleted successfully!'.tr;
          print("✅ Success message: $successMessage");
          kSnackBar(
            message: successMessage,
            bgColor: AppColors.green,
          );

          await getProducts(); // Refresh product list
          return;
        } else {
          throw 'Failed to delete product: No response data';
        }
      } catch (e) {
        attempts++;
        print("❌ Attempt $attempts failed: $e");
        if (attempts == retryCount) {
          kSnackBar(
            message: e is TimeoutException
                ? 'Request timed out after $retryCount attempts. Check your network or server.'
                : 'Failed after $retryCount attempts: $e',
            bgColor: AppColors.red,
          );
        } else {
          print("🔄 Retrying in 2 seconds...");
          await Future.delayed(const Duration(seconds: 2));
        }
      } finally {
        isLoading(false);
      }
    }
  }
}