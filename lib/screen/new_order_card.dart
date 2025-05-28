import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/utils.dart';

class NewOrderCard extends StatelessWidget {
  final int index;
  final String name;
  final String number;

  const NewOrderCard({
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
          Container(
            alignment:
            Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
            child: Text(
              "Order number #123456".tr,
              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 18.spm(context),
                color: ColorUtils.black33,
              ),
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 48.hm(context),
                  decoration: BoxDecoration(
                    color: ColorUtils.blue192,
                    borderRadius: BorderRadius.circular(8.rm(context)),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () => Get.back(),
                    child: Center(
                      child: Text(
                        "Accept".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.spm(context),
                          color: ColorUtils.white255,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
              Expanded(
                child: Container(
                  height: 48.hm(context),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorUtils.gray136, width: 1),
                    color: ColorUtils.white255,
                    borderRadius: BorderRadius.circular(8.rm(context)),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () => Get.back(),
                    child: Center(
                      child: Text(
                        "Reject".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.spm(context),
                          color: ColorUtils.black51,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}