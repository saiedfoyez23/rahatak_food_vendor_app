import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screen/screen.dart';
import '../utils/utils.dart';
import '../controller/settings_controller.dart';

class TermsAndConditionsScreenWidget extends GetxController {
  Widget termsAndConditionsScreenWidget({required BuildContext context}) {
    final SettingsController settingsController = Get.find<SettingsController>();

    if (MediaQuery.sizeOf(context).height > 1000) {
      return SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: Obx(() => Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SpacerWidget.spacerWidget(spaceHeight: 11.ht(context)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40.ht(context),
                                  width: 40.wt(context),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: settingsController.isLoading.value
                                        ? null
                                        : () {
                                      Get.off(
                                            () => ProfileScreen(),
                                        duration: const Duration(milliseconds: 300),
                                        transition: Transition.fadeIn,
                                        preventDuplicates: false,
                                      );
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.authorizationBackButtonImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Terms and Conditions".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SpacerWidget.spacerWidget(spaceHeight: 35.ht(context)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
                          child: Container(
                            width: 744.wt(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.hpmt(context), vertical: 20.vpmt(context)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rm(context)),
                              border: Border.all(
                                color: ColorUtils.gray163,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Get.locale.toString() == "en"
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Text(
                                    "Terms and Conditions of the Application".tr,
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.start
                                        : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 20.spt(context)),
                                    ),
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                                Container(
                                  alignment: Get.locale.toString() == "en"
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Text(
                                    settingsController.termsAndConditions.value,
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.start
                                        : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 16.spt(context)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (settingsController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: ColorUtils.black255,
                  ),
                ),
            ],
          )),
        ),
      );
    } else {
      return SafeArea(
        child: Container(
          height: 844.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: Obx(() => Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hm(context)),
                      child: Column(
                        children: [
                          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40.hm(context),
                                  width: 40.wm(context),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: settingsController.isLoading.value
                                        ? null
                                        : () {
                                      Get.off(
                                            () => ProfileScreen(),
                                        duration: const Duration(milliseconds: 300),
                                        transition: Transition.fadeIn,
                                        preventDuplicates: false,
                                      );
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.authorizationBackButtonImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Terms and Conditions".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpacerWidget.spacerWidget(spaceHeight: 35.hm(context)),
                          Container(
                            width: 390.wm(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.hpmm(context), vertical: 20.vpmm(context)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rm(context)),
                              border: Border.all(
                                color: ColorUtils.gray163,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Get.locale.toString() == "en"
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Text(
                                    "Terms and Conditions of the Application".tr,
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.start
                                        : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.spm(context),
                                      color: ColorUtils.black255,
                                      height: (25.hm(context) / 20.spm(context)),
                                    ),
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                                Container(
                                  alignment: Get.locale.toString() == "en"
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Text(
                                    settingsController.termsAndConditions.value,
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.start
                                        : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spm(context),
                                      color: ColorUtils.black255,
                                      height: (25.hm(context) / 16.spm(context)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (settingsController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: ColorUtils.black255,
                  ),
                ),
            ],
          )),
        ),
      );
    }
  }
}