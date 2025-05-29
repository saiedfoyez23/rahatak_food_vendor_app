import 'package:get/get.dart';
import '../model/order_model.dart';
import 'order_data_controller.dart';

class OrderController extends GetxController {
  final OrderDataController orderDataController = Get.find<OrderDataController>();
  RxString changeOrder = "New Orders".obs;
  RxList<bool> showOrderDetails = <bool>[].obs;

  void updateOrderType(String type) {
    changeOrder.value = type;
  }

  void toggleOrderDetails(int index) {
    if (index >= showOrderDetails.length) {
      showOrderDetails.addAll(List.generate(index - showOrderDetails.length + 1, (_) => false));
    }
    showOrderDetails[index] = !showOrderDetails[index];
  }

  List<OrderData> getOrdersByType() {
    switch (changeOrder.value) {
      case "New Orders":
        return orderDataController.pendingOrders;
      case "Ongoing Orders":
        return [
          ...orderDataController.receivedOrders,
          ...orderDataController.processingOrders,
          ...orderDataController.ongoingOrders,
        ];
      case "Completed Orders":
        return orderDataController.deliveredOrders;
      case "Cancelled Orders":
        return orderDataController.canceledOrders;
      default:
        return orderDataController.allOrders;
    }
  }
}