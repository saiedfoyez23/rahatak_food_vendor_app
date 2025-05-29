import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/order_data_controller.dart';
import '../model/order_model.dart';
import '../utils/utils.dart';

class StatusDropdown extends StatelessWidget {
  final int index;
  final OrderData order;
  final OrderDataController controller = Get.find<OrderDataController>();
  final RxBool isOpen = false.obs;

  StatusDropdown({super.key, required this.index, required this.order});

  @override
  Widget build(BuildContext context) {
    final List<String> statuses = [
      'received',
      'processing',
      'ongoing',
      'delivered',
      'canceled',
    ];

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
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () => isOpen.value = !isOpen.value,
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  order.status?.capitalizeFirst ?? 'Order Status'.tr,
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
                  isOpen.value
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_up_rounded,
                  size: 18.sm(context),
                  color: ColorUtils.black51,
                ),
              ],
            )),
          ),
        ),
        Obx(() => isOpen.value
            ? Container(
          width: 145.wm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
            borderRadius: BorderRadius.circular(10.rm(context)),
            border: Border.all(color: ColorUtils.white217, width: 0.5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                color: ColorUtils.black05,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: statuses
                .map((status) => Container(
              height: 42.hm(context),
              width: 145.wm(context),
              decoration:
              const BoxDecoration(color: Colors.transparent),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  isOpen.value = false;
                  controller.updateOrderStatus(order.id!, status);
                },
                child: Center(
                  child: Text(
                    status.capitalizeFirst ?? status,
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
            : Container()),
      ],
    );
  }
}


class OrderItem extends StatelessWidget {
  final Item item;
  final bool hasBorder;

  const OrderItem({
    required this.item,
    required this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.wm(context),
      padding: EdgeInsets.symmetric(
        vertical: 9.vpmm(context),
        horizontal: 9.hpmm(context),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: hasBorder
            ? DecorationImage(
          image: AssetImage(ImagePathUtils.borderIconImagePath),
          fit: BoxFit.fill,
        )
            : null,
      ),
      child: Row(
        children: [
          Container(
            height: 100.hm(context),
            width: 80.wm(context),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                ImagePathUtils.plusIconImagePath, // Placeholder; fetch product image if available
                fit: BoxFit.fill,
              ),
            ),
          ),
          SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Get.locale.toString() == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    item.product ?? 'Unknown'.tr,
                    textAlign: Get.locale.toString() == 'en'
                        ? TextAlign.start
                        : TextAlign.end,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.spm(context),
                      color: ColorUtils.black30,
                    ),
                  ),
                ),
                SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                Container(
                  alignment: Get.locale.toString() == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    'Discount: ${item.discount ?? 0}%'.tr,
                    textAlign: Get.locale.toString() == 'en'
                        ? TextAlign.start
                        : TextAlign.end,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.spm(context),
                      color: ColorUtils.black30,
                    ),
                  ),
                ),
                SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                Container(
                  alignment: Get.locale.toString() == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    'Quantity: ${item.quantity}'.tr,
                    textAlign: Get.locale.toString() == 'en'
                        ? TextAlign.start
                        : TextAlign.end,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.spm(context),
                      color: ColorUtils.black30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}