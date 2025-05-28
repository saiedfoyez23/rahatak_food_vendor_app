import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_vendor_app/screen/screen.dart';
import '../controller/settings_controller.dart';
import '../widget/terms_and_condition_screen_widget.dart';


class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({super.key});

  final TermsAndConditionsScreenWidget termsAndConditionsScreenWidget =
  Get.put(TermsAndConditionsScreenWidget());

  @override
  Widget build(BuildContext context) {
    // Ensure SettingsController is initialized
    Get.put(SettingsController());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop, onPopInvoked) {
        Get.off(
              () => ProfileScreen(),
          duration: const Duration(milliseconds: 300),
          transition: Transition.fadeIn,
          preventDuplicates: false,
        );
      },
      child: Scaffold(
        body: termsAndConditionsScreenWidget.termsAndConditionsScreenWidget(context: context),
      ),
    );
  }
}