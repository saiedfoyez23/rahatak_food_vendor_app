import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/data/api.dart';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../model/category_model.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  var categories = <Datum>[].obs;
  var categoryNames = <String>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      isLoading(true);

      Map<String, String> headers = {
        'Authorization': "${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.categories,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        CategoryModel categoryModel = CategoryModel.fromJson(responseBody);
        if (categoryModel.success == true) {
          categories.assignAll(categoryModel.data);
          categoryNames.assignAll(categoryModel.data.map((datum) => datum.name ?? '').toList());
        } else {
          throw categoryModel.message ?? 'Failed to fetch categories!';
        }
      } else {
        throw 'Failed to fetch categories!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}