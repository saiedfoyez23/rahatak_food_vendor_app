import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/order_controller.dart';
import '../utils/utils.dart';

class OrderHeader extends StatelessWidget {
  OrderHeader({super.key});

  // Use Get.find to access the already instantiated controller
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
        child: Column(
          children: [
            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpacerWidget.spacerWidget(),
                Obx(() => Container(
                  alignment: Alignment.center,
                  child: Text(
                    orderController.changeOrder.value.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.spm(context),
                      color: ColorUtils.black255,
                    ),
                  ),
                )),
                Container(
                  height: 24.hm(context),
                  width: 24.wm(context),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return _OrderTypeDialog();
                        },
                      );
                    },
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(
                        ImagePathUtils.listShowImagePath,
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SpacerWidget.spacerWidget(spaceHeight: 36.hm(context)),
          ],
        ),
      ),
    );
  }
}

class _OrderTypeDialog extends StatelessWidget {
  final OrderController controller = Get.find<OrderController>();

  _OrderTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> orderTypes = [
      "New Orders",
      "Ongoing Orders",
      "Completed Orders",
      "Cancelled Orders"
    ];

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height > 1000
            ? 50.tpmt(context)
            : 45.tpmm(context),
        bottom: MediaQuery.sizeOf(context).height > 1000
            ? 900.tpmt(context)
            : 600.tpmm(context),
        left: MediaQuery.sizeOf(context).width > 500
            ? 557.rpmt(context)
            : 232.rpmm(context),
        right: MediaQuery.sizeOf(context).width > 500
            ? 37.lpmt(context)
            : 16.lpmm(context),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height > 1000
            ? 88.ht(context)
            : 88.hm(context),
        width: MediaQuery.sizeOf(context).width > 500
            ? 150.wt(context)
            : 150.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
          borderRadius: BorderRadius.circular(
              MediaQuery.sizeOf(context).height > 1000
                  ? 10.rt(context)
                  : 10.rm(context)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              color: ColorUtils.black05,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: orderTypes
              .map((type) => _OrderTypeButton(type: type, context: context))
              .toList(),
        ),
      ),
    );
  }
}

class _OrderTypeButton extends StatelessWidget {
  final String type;
  final BuildContext context;
  final OrderController controller = Get.find<OrderController>();

  _OrderTypeButton({required this.type, required this.context, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
      MediaQuery.sizeOf(context).height > 1000 ? 42.ht(context) : 42.hm(context),
      width:
      MediaQuery.sizeOf(context).width > 500 ? 150.wt(context) : 150.wm(context),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          controller.updateOrderType(type);
          Get.back();
        },
        child: Center(
          child: Text(
            type.tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: MediaQuery.sizeOf(context).height > 1000
                  ? 16.spt(context)
                  : 16.spm(context),
              color: ColorUtils.black33,
            ),
          ),
        ),
      ),
    );
  }
}
