import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/order_controller.dart';
import '../controller/order_data_controller.dart';
import '../model/order_model.dart';
import '../utils/utils.dart';
import 'new_order_card.dart';
import 'ongoing_order_card.dart';

class OrderList extends StatelessWidget {
  final OrderController controller = Get.find<OrderController>();
  final OrderDataController dataController = Get.find<OrderDataController>();

  OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
      child: Obx(() {
        if (dataController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final orders = controller.getOrdersByType();
        if (orders.isEmpty) {
          return Center(child: Text('No orders found'.tr));
        }
        return Column(
          children: orders.asMap().entries.map((entry) {
            final order = entry.value;
            final index = entry.key;
            return Column(
              children: [
                order.status == 'pending'
                    ? NewOrderCard(index: index, order: order)
                    : OngoingOrderCard(index: index, order: order),
                SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}