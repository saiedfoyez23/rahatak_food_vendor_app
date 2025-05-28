import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/screen/status_dropdown.dart';

import '../controller/order_controller.dart';
import '../utils/utils.dart';
import 'order_details.dart';


class OngoingOrderCard extends StatelessWidget {
  final int index;
  final String name;
  final String number;
  final controller = Get.find<OrderController>();

  OngoingOrderCard({
    super.key,
    required this.index,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.wm(context),
      padding: EdgeInsets.symmetric(
          vertical: 9.vpmm(context), horizontal: 8.hpmm(context)),
      decoration: BoxDecoration(
        border: Border.all(color: ColorUtils.gray155, width: .5),
        borderRadius: BorderRadius.circular(10.rm(context)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Get.locale.toString() == "en"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Text(
                  "Order number #123456".tr,
                  textAlign:
                  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.spm(context),
                    color: ColorUtils.black33,
                  ),
                ),
              ),
              StatusDropdown(index: index),
            ],
          ),
          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
          Container(
            alignment:
            Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
            child: Text(
              name.tr,
              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 16.spm(context),
                color: ColorUtils.gray117,
              ),
            ),
          ),
          SpacerWidget.spacerWidget(spaceHeight: 3.hm(context)),
          Container(
            alignment:
            Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
            child: Text(
              number.tr,
              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 16.spm(context),
                color: ColorUtils.gray117,
              ),
            ),
          ),
          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
          Container(
            height: 1.5.hm(context),
            width: 390.wm(context),
            decoration: BoxDecoration(color: ColorUtils.white217),
          ),
          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
          Obx(() => Container(
            height: 37.hm(context),
            width: 390.wm(context),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => controller.toggleOrderDetails(index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Details".tr,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.spm(context),
                        color: ColorUtils.blue192,
                      ),
                    ),
                  ),
                  SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                  Icon(
                    (index == 0 && controller.firstOrder.value) ||
                        (index == 1 && controller.secondOrder.value) ||
                        (index == 2 && controller.thirdOrder.value)
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    size: 25.sm(context),
                    color: ColorUtils.blue192,
                  ),
                ],
              ),
            ),
          )),
          Obx(() =>
          (index == 0 && controller.firstOrder.value) ||
              (index == 1 && controller.secondOrder.value) ||
              (index == 2 && controller.thirdOrder.value)
              ? OrderDetails()
              : SpacerWidget.spacerWidget()),
        ],
      ),
    );
  }
}