import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/screen/screen.dart';

import '../widget/widget.dart';


class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  HelpCenterScreenWidget helpCenterScreenWidget = Get.put(HelpCenterScreenWidget());


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: helpCenterScreenWidget.helpCenterScreenWidget(context: context),
      ),
    );
  }
}
