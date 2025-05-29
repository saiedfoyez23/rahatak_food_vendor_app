import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/order_controller.dart';
import '../controller/order_data_controller.dart';
import 'order_header.dart';
import 'order_list.dart';
import '../utils/utils.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});
   final OrderDataController orderDataController = Get.put(OrderDataController());

  final OrderController orderController = Get.put(OrderController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 844.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: OrderHeader(),
              ),
              SliverToBoxAdapter(
                child: OrderList(),
              ),
            ],
          ),
        ),
      ),
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