import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/utils/utils.dart';
import 'package:rahatak_food_vendor_app/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenWidget homeScreenWidget = Get.put(HomeScreenWidget());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreenWidget.homeScreenWidget(context: context),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: true,
        isMenuFocus: false,
        isOrderFocus: false,
        isProfileFocus: false,
      ),
    );
  }
}
