import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/notification_controller.dart'; // Import the new controller
import '../screen/screen.dart';
import '../utils/utils.dart';

class NotificationScreenWidget extends GetxController {
  // Instantiate the NotificationController
  final NotificationController notificationController = Get.put(NotificationController());

  Widget notificationScreenWidget({required BuildContext context}) {
    return SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
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
                              onPressed: () {
                                Get.off(
                                      () => HomeScreen(),
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
                                "Notification".tr,
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

                    SpacerWidget.spacerWidget(spaceHeight: 26.hm(context)),

                    // Dynamically display notifications using Obx
                    Obx(() {
                      if (notificationController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (notificationController.notifications.isEmpty) {
                        return Center(
                          child: Text(
                            "No notifications available".tr,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.spm(context),
                              color: ColorUtils.black255,
                            ),
                          ),
                        );
                      }
                      return Column(
                        children: notificationController.notifications.map((notification) {
                          // Determine color and icon based on hasRead status
                          final bool isRead = notification.hasRead ?? false;
                          final Color leftBarColor = isRead ? ColorUtils.green142 : ColorUtils.yellow160;
                          final String iconPath = isRead
                              ? ImagePathUtils.checkIconImagePath
                              : ImagePathUtils.bxsErrorIconImagePath;
                          // Calculate container height based on content
                          final double containerHeight = notification.body != null && notification.body!.length > 50
                              ? 120.hm(context)
                              : 95.hm(context);

                          return Column(
                            children: [
                              Container(
                                height: containerHeight,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.rm(context)),
                                  border: Border.all(color: ColorUtils.white217, width: 0.5),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: containerHeight,
                                      width: 38.wm(context),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.rm(context)),
                                          bottomLeft: Radius.circular(10.rm(context)),
                                        ),
                                        color: leftBarColor,
                                      ),
                                      child: Container(
                                        height: 24.hm(context),
                                        width: 24.wm(context),
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                            iconPath,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: containerHeight,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.hpmm(context),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.rm(context)),
                                            bottomRight: Radius.circular(10.rm(context)),
                                          ),
                                          color: ColorUtils.white255,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Get.locale.toString() == "en"
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: Text(
                                                notification.title ?? "No Title".tr,
                                                textAlign: Get.locale.toString() == "en"
                                                    ? TextAlign.start
                                                    : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.spm(context),
                                                  color: ColorUtils.black255,
                                                ),
                                              ),
                                            ),
                                            SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
                                            Container(
                                              alignment: Get.locale.toString() == "en"
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: Text(
                                                notification.body ?? "No Body".tr,
                                                textAlign: Get.locale.toString() == "en"
                                                    ? TextAlign.start
                                                    : TextAlign.start,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.spm(context),
                                                  color: ColorUtils.black255,
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
                              SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                            ],
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}