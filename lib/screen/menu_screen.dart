import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/widget/widget.dart';

import '../utils/utils.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  MenuScreenWidget menuScreenWidget = Get.put(MenuScreenWidget());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menuScreenWidget.menuScreenWidget(context: context),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: false,
        isMenuFocus: true,
        isOrderFocus: false,
        isProfileFocus: false,
      ),
    );
  }
}
