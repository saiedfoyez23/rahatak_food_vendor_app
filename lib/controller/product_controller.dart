import 'package:get/get.dart';
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

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    try {
      isLoading(true);

      Map<String, String> headers = {
        'Authorization': "${LocalStorage.getData(key: AppConstant.token)}",
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
       
          api: Api.allProduct(storeID: "68271777b6bf9f3ec0e52a12"),
         // api: Api.allProduct(storeID: "${LocalStorage.getData(key: AppConstant.storeId)}"),
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
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}