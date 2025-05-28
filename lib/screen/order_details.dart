import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/utils.dart';

class OrderDetails extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "image": ImagePathUtils.pList_1,
      "name": "Tanoore",
      "price": "1.900 OMR",
      "quantity": "1",
      "size": "Middle"
    },
    {
      "image": ImagePathUtils.pList_4,
      "name": "Sandwich Pack",
      "price": "2.200 OMR",
      "quantity": "2",
      "size": "Middle"
    },
    {
      "image": ImagePathUtils.pList_3,
      "name": "Chicken Fries",
      "price": "3.000 OMR",
      "quantity": "2",
      "size": "Middle"
    },
  ];

  OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...items
            .asMap()
            .entries
            .map((entry) => Column(
          children: [
            _OrderItem(
              image: entry.value["image"]!,
              name: entry.value["name"]!,
              price: entry.value["price"]!,
              quantity: entry.value["quantity"]!,
              size: entry.value["size"]!,
              hasBorder: entry.key < items.length - 1,
            ),
            SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),
          ],
        ))
            .toList(),
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
              alignment: Get.locale.toString() == "en"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Text(
                "Total Amount".tr,
                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.spm(context),
                  color: ColorUtils.black33,
                ),
              ),
            ),
            Container(
              alignment: Get.locale.toString() == "en"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Text(
                "8.800 OMR".tr,
                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
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

class _OrderItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String quantity;
  final String size;
  final bool hasBorder;

  const _OrderItem({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.size,
    required this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.wm(context),
      padding: EdgeInsets.symmetric(
          vertical: 9.vpmm(context), horizontal: 9.hpmm(context)),
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: hasBorder
            ? DecorationImage(
          image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
          fit: BoxFit.fill,
        )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.hm(context),
            width: 80.wm(context),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Get.locale.toString() == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    name.tr,
                    textAlign:
                    Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.spm(context),
                      color: ColorUtils.black30,
                    ),
                  ),
                ),
                SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                Container(
                  alignment: Get.locale.toString() == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    price.tr,
                    textAlign:
                    Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.spm(context),
                      color: ColorUtils.black30,
                    ),
                  ),
                ),
                SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                Container(
                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                  child: Text(
                    "Quantity: $quantity".tr,
                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.spm(context),
                      color: ColorUtils.black30,
                    ),
                  ),
                ),
                SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                Container(
                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                  child: Text(
                    "Size: $size".tr,
                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.spm(context),
                      color: ColorUtils.black30,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}