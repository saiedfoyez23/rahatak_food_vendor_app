import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/order_controller.dart';
import '../widget/widget.dart';
import '../utils/utils.dart';


class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});

  final OrderScreenWidget orderScreenWidget = Get.put(OrderScreenWidget());
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orderScreenWidget.orderScreenWidget(context: context),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: false,
        isMenuFocus: false,
        isOrderFocus: true,
        isProfileFocus: false,
      ),
    );
  }
}