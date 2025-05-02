import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/screen/screen.dart';

import '../widget/widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  ForgotPasswordScreenWidget forgotPasswordScreenWidget = Get.put(ForgotPasswordScreenWidget());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: forgotPasswordScreenWidget.forgotPasswordScreenWidget(context: context),
      ),
    );
  }
}