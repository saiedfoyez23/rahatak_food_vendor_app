import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/order_controller.dart';
import '../utils/utils.dart';


class StatusDropdown extends StatelessWidget {
  final int index;
  final controller = Get.find<OrderController>();

  StatusDropdown({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.hm(context),
          width: 145.wm(context),
          padding: EdgeInsets.symmetric(
              vertical: 5.vpmm(context), horizontal: 5.hpmm(context)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.rm(context)),
            border: Border.all(color: ColorUtils.white217, width: 0.5),
          ),
          alignment: Alignment.center,
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () => controller.toggleOrderTrack(index),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _getStatus(index).tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.spm(context),
                    color: ColorUtils.black51,
                  ),
                ),
                SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),
                Icon(
                  _isTrackOpen(index)
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_up_rounded,
                  size: 15.sm(context),
                  color: ColorUtils.black51,
                ),
              ],
            )),
          ),
        ),
        Obx(() => _isTrackOpen(index)
            ? Container(
          width: 145.wm(context),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.rm(context)),
            border: Border.all(color: ColorUtils.white217, width: 0.5),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              "In Process",
              "Being Prepared",
              "Prepared",
              "Delivery in progress",
              "Complete",
              "Cancelled"
            ]
                .map((status) => Container(
              height: 42.hm(context),
              width: 145.wm(context),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () =>
                    controller.updateOrderStatus(index, status),
                child: Center(
                  child: Text(
                    status.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.spm(context),
                      color: ColorUtils.black33,
                    ),
                  ),
                ),
              ),
            ))
                .toList(),
          ),
        )
            : SpacerWidget.spacerWidget()),
      ],
    );
  }

  String _getStatus(int index) {
    switch (index) {
      case 0:
        return controller.firstChangeStatus.value == ""
            ? "Order Status"
            : controller.firstChangeStatus.value;
      case 1:
        return controller.secondChangeStatus.value == ""
            ? "Order Status"
            : controller.secondChangeStatus.value;
      case 2:
        return controller.thirdChangeStatus.value == ""
            ? "Order Status"
            : controller.thirdChangeStatus.value;
      default:
        return "Order Status";
    }
  }

  bool _isTrackOpen(int index) {
    switch (index) {
      case 0:
        return controller.firstOrderTrack.value;
      case 1:
        return controller.secondOrderTrack.value;
      case 2:
        return controller.thirdOrderTrack.value;
      default:
        return false;
    }
  }
}