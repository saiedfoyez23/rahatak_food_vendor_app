import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/screen/status_dropdown.dart';
import '../model/order_model.dart';
import '../utils/utils.dart';

class OrderDetails extends StatelessWidget {
  final OrderData order;

  const OrderDetails({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...order.items.asMap().entries.map((entry) => Column(
          children: [
            OrderItem(
              item: entry.value,
              hasBorder: entry.key < order.items.length - 1,
            ),
            SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
          ],
        )).toList(),
        Container(
          height: 1.5.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(color: ColorUtils.white217),
        ),
        SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Get.locale.toString() == 'en'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Text(
                'Total Amount'.tr,
                textAlign: Get.locale.toString() == 'en'
                    ? TextAlign.start
                    : TextAlign.end,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.spm(context),
                  color: ColorUtils.black33,
                ),
              ),
            ),
            Container(
              alignment: Get.locale.toString() == 'en'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                '${order.total?.toStringAsFixed(2)} OMR'.tr,
                textAlign: Get.locale.toString() == 'en'
                    ? TextAlign.end
                    : TextAlign.start,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.spm(context),
                  color: ColorUtils.black33,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}