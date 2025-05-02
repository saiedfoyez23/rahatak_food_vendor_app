import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/widget/widget.dart';

import '../utils/utils.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});

  OrderScreenWidget orderScreenWidget = Get.put(OrderScreenWidget());


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
