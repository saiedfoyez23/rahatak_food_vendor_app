import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/widget/widget.dart';

import '../utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileScreenWidget profileScreenWidget = Get.put(ProfileScreenWidget());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileScreenWidget.profileScreenWidget(context: context),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: false,
        isMenuFocus: false,
        isOrderFocus: false,
        isProfileFocus: true,
      ),
    );
  }
}
