import 'package:get/get.dart';
import 'dart:convert';
import 'package:rahatak_food_vendor_app/data/base_client.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/app_constant/app_constant.dart';
import 'package:rahatak_food_vendor_app/utils/helper/local_store.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import '../model/order_model.dart';

class OrderDataController extends GetxController {
  var isLoading = true.obs;
  var allOrders = <OrderData>[].obs;
  var pendingOrders = <OrderData>[].obs;
  var receivedOrders = <OrderData>[].obs;
  var processingOrders = <OrderData>[].obs;
  var ongoingOrders = <OrderData>[].obs;
  var deliveredOrders = <OrderData>[].obs;
  var canceledOrders = <OrderData>[].obs;
  var totalOrders = 0.obs;

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  Future<void> getOrders() async {
    try {
      isLoading(true);

      Map<String, String> headers = {
        'Authorization': 'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: 'http://192.168.10.43:5010/api/v1/orders/vendor',
          headers: headers,
        ),
      );

      if (responseBody != null) {
        OrderModel orderModel = OrderModel.fromJson(responseBody);
        if (orderModel.success == true && orderModel.data != null) {
          allOrders.assignAll(orderModel.data!.data);
          pendingOrders.assignAll(
            orderModel.data!.data.where((order) => order.status == 'pending').toList(),
          );
          receivedOrders.assignAll(
            orderModel.data!.data.where((order) => order.status == 'received').toList(),
          );
          processingOrders.assignAll(
            orderModel.data!.data.where((order) => order.status == 'processing').toList(),
          );
          ongoingOrders.assignAll(
            orderModel.data!.data.where((order) => order.status == 'ongoing').toList(),
          );
          deliveredOrders.assignAll(
            orderModel.data!.data.where((order) => order.status == 'delivered').toList(),
          );
          canceledOrders.assignAll(
            orderModel.data!.data.where((order) => order.status == 'canceled').toList(),
          );
          totalOrders.value = orderModel.data!.meta?.total ?? 0;
        } else {
          throw orderModel.message ?? 'Failed to fetch orders!';
        }
      } else {
        throw 'Failed to fetch orders!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> acceptOrder(String orderId) async {
    await updateOrderStatus(orderId, 'received');
  }

  Future<void> rejectOrder(String orderId) async {
    await updateOrderStatus(orderId, 'canceled');
  }


  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      isLoading(true);

      Map<String, String> headers = {
        'Authorization': 'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {'status': status};

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.patchRequest(
          api: 'http://192.168.10.43:5010/api/v1/orders/$orderId',
          headers: headers,
          body: jsonEncode(body),
        ),
      );

      if (responseBody != null && responseBody['success'] == true) {
        await getOrders(); // Refresh orders after status update
        kSnackBar(message: 'Order status updated to $status', bgColor: AppColors.green);
      } else {
        throw responseBody['message'] ?? 'Failed to update order status!';
      }
    } catch (e) {
      print("Catch Error: $e");
      kSnackBar(message: e.toString(), bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

}
