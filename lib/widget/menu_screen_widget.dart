import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/utils/utils.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';
import 'package:rahatak_food_vendor_app/widget/widget.dart';
import '../controller/product_controller.dart';
import '../utils/app_color/app_colors.dart';
import '../utils/app_text_style/styles.dart';

class MenuScreenWidget extends GetxController {
  final ProductController productController = Get.put(ProductController());

  Widget menuScreenWidget({required BuildContext context}) {
    return SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Menu Management".tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.spm(context),
                        color: ColorUtils.black255,
                      ),
                    ),
                  ),
                  SpacerWidget.spacerWidget(spaceHeight: 36.hm(context)),
                ],
              ),
            ),
            ProductListWidget(productController: productController),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hm(context)),
                child: Column(
                  children: [
                    SpacerWidget.spacerWidget(spaceHeight: 37.hm(context)),
                    Container(
                      height: 48.hm(context),
                      width: 300.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(8.rm(context)),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          showAdaptiveDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => AddProductDialog(),
                          );
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Add a new meal".tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.spm(context),
                                  color: ColorUtils.white255,
                                ),
                              ),
                              SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                              Icon(Icons.add, size: 24.sm(context), color: ColorUtils.white248),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 37.hm(context)),
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

class ProductListWidget extends StatelessWidget {
  final ProductController productController;

  ProductListWidget({required this.productController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => productController.isLoading.value
        ? SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(color: AppColors.mainColor),
      ),
    )
        : productController.totalProducts.value == 0
        ? SliverToBoxAdapter(
      child: Center(
        child: Text("No menu here", style: h2),
      ),
    )
        : SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          var foodDetails = productController.products;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.hpmm(context),
                vertical: 12.vpmm(context),
              ),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
                borderRadius: BorderRadius.circular(12.rm(context)),
                border: Border.all(color: ColorUtils.white217, width: 1),
              ),
              margin: EdgeInsets.only(bottom: 10.bpmm(context)),
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: null,
                child: Row(
                  children: [
                    Container(
                      height: 100.hm(context),
                      width: 100.wm(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.rm(context)),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: foodDetails[index].images.isNotEmpty
                            ? Image.network(
                          foodDetails[index].images[0],
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            size: 50.sm(context),
                            color: ColorUtils.gray136,
                          ),
                        )
                            : Icon(
                          Icons.image_not_supported,
                          size: 50.sm(context),
                          color: ColorUtils.gray136,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Get.locale.toString() == "en"
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Text(
                              foodDetails[index].name.toString(),
                              textAlign: Get.locale.toString() == "en"
                                  ? TextAlign.start
                                  : TextAlign.end,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),
                          SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
                          Container(
                            alignment: Get.locale.toString() == "en"
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Text(
                              foodDetails[index].description.toString(),
                              textAlign: Get.locale.toString() == "en"
                                  ? TextAlign.start
                                  : TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.spm(context),
                                color: ColorUtils.gray117,
                              ),
                            ),
                          ),
                          SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 18.hm(context),
                                    width: 17.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.timeIconImagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${foodDetails[index].timeRequired} Minutes",
                                      textAlign: TextAlign.start,
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
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  foodDetails[index].variations.isNotEmpty
                                      ? "${foodDetails[index].variations[0].price} OMR"
                                      : "N/A",
                                  textAlign: TextAlign.start,
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
                          SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
                        ],
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 24.hm(context),
                          width: 24.wm(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              showAdaptiveDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => EditProductDialog(index: index),
                              );
                            },
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                ImagePathUtils.editIconImagePath,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        SpacerWidget.spacerWidget(spaceHeight: 15.hm(context)),
                        Container(
                          height: 24.hm(context),
                          width: 24.wm(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              showAdaptiveDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => DeleteProductDialog(index: index),
                              );
                            },
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                ImagePathUtils.deleteIconImagePath,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: productController.products.length,
      ),
    ));
  }
}

class AddProductDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(
        vertical: 100.vpmm(context),
        horizontal: 16.hpmm(context),
      ),
      child: Container(
        width: 358.wm(context),
        height: 550.hm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
          borderRadius: BorderRadius.circular(16.rm(context)),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30.vpmm(context),
          horizontal: 20.hpmm(context),
        ),
        child: Material(
          color: Colors.transparent,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 138.hm(context),
                      width: 358.wm(context),
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SizedBox(
                            height: 138.hm(context),
                            width: 358.wm(context),
                          ),
                          Container(
                            height: 138.hm(context),
                            width: 358.wm(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rm(context)),
                              color: ColorUtils.white217,
                            ),
                            child: Center(
                              child: Icon(Icons.add, size: 36.sm(context), color: ColorUtils.blue192),
                            ),
                          ),
                          Container(
                            height: 138.hm(context),
                            width: 358.wm(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rm(context)),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 10.vpmm(context),
                              horizontal: 10.hpmm(context),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 24.hm(context),
                                  width: 24.wm(context),
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () {
                                      controller.selectedImages.clear();
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.deleteCircleIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          4,
                              (index) {
                            if (index == 0) {
                              return Container(
                                height: 60.hm(context),
                                width: 60.wm(context),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.rm(context)),
                                  color: ColorUtils.white217,
                                ),
                                margin: EdgeInsets.only(right: 10.rpmm(context)),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () async {
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                     // allowedExtensions: ['jpg', 'jpeg', 'png', 'svg'],
                                    );
                                    if (result != null) {
                                      controller.selectedImages.assignAll(result.files);
                                      print('Files selected: ${result.files.map((f) => f.name)}');
                                    }
                                  },
                                  child: Center(
                                    child: Icon(Icons.add, size: 24.sm(context), color: ColorUtils.blue192),
                                  ),
                                ),
                              );
                            } else {
                              return Obx(() {
                                final image = controller.selectedImages.length > index - 1
                                    ? controller.selectedImages[index - 1]
                                    : null;
                                return Container(
                                  height: 60.hm(context),
                                  width: 60.wm(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.rm(context)),
                                    color: ColorUtils.white217,
                                  ),
                                  margin: EdgeInsets.only(right: 10.rpmm(context)),
                                  child: image != null
                                      ? Image.file(
                                    File(image.path!),
                                    fit: BoxFit.cover,
                                  )
                                      : const SizedBox.shrink(),
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Meal Name *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.mealNameController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter meal name".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Meal Description *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.mealDescriptionController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter description here".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Price *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.priceController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "0.000".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Time Required *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.timeRequiredController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "00:00 minutes / hours".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                    Container(
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Meal Size *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          3,
                              (index) {
                            return Container(
                              height: 48.hm(context),
                              width: 96.wm(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rm(context)),
                                border: Border.all(
                                  color: ProductController.selectSize.value == index
                                      ? ColorUtils.blue192
                                      : ColorUtils.gray136,
                                  width: 1,
                                ),
                                color: ProductController.selectSize.value == index
                                    ? ColorUtils.white255
                                    : ColorUtils.white233,
                              ),
                              margin: EdgeInsets.only(right: 10.rpmm(context)),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () {
                                  ProductController.selectSize.value = index;
                                },
                                child: Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      index == 0 ? "SMALL".tr : index == 1 ? "MIDDLE".tr : "LARGE".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.spm(context),
                                        color: ProductController.selectSize.value == index
                                            ? ColorUtils.black51
                                            : ColorUtils.gray136,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 48.hm(context),
                          width: 153.wm(context),
                          decoration: BoxDecoration(
                            color: ColorUtils.blue192,
                            borderRadius: BorderRadius.circular(8.rm(context)),
                          ),
                          child: Obx(() => TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                              if (ProductController.mealNameController.value.text.isEmpty ||
                                  ProductController.mealDescriptionController.value.text.isEmpty ||
                                  ProductController.priceController.value.text.isEmpty ||
                                  ProductController.timeRequiredController.value.text.isEmpty) {
                                kSnackBar(
                                  message: 'Please fill all required fields.'.tr,
                                  bgColor: AppColors.red,
                                );
                                return;
                              }
                              double? price = double.tryParse(ProductController.priceController.value.text);
                              int? time = int.tryParse(ProductController.timeRequiredController.value.text.split(' ')[0]);
                              if (price == null || price <= 0) {
                                kSnackBar(
                                  message: 'Please enter a valid price.'.tr,
                                  bgColor: AppColors.red,
                                );
                                return;
                              }
                              if (time == null || time <= 0) {
                                kSnackBar(
                                  message: 'Please enter a valid time required.'.tr,
                                  bgColor: AppColors.red,
                                );
                                return;
                              }
                              await controller.addProduct(
                                name: ProductController.mealNameController.value.text,
                                description: ProductController.mealDescriptionController.value.text,
                                price: ProductController.priceController.value.text,
                                timeRequired: ProductController.timeRequiredController.value.text,
                                selectedSize: ProductController.selectSize.value,
                              );
                            },
                            child: Center(
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                color: ColorUtils.white255,
                                strokeWidth: 2.0,
                              )
                                  : Text(
                                "Save".tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.spm(context),
                                  color: ColorUtils.white255,
                                ),
                              ),
                            ),
                          )),
                        ),
                        SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                        Container(
                          height: 48.hm(context),
                          width: 153.wm(context),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.gray136, width: 1),
                            color: ColorUtils.white255,
                            borderRadius: BorderRadius.circular(8.rm(context)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: controller.isLoading.value ? null : () => Get.back(),
                            child: Center(
                              child: Text(
                                "Cancel".tr,
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class EditProductDialog extends StatelessWidget {
  final int index;

  EditProductDialog({required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    final product = controller.products[index];

    // Initialize controllers with existing product data
    ProductController.mealNameController.value.text = product.name ?? '';
    ProductController.mealDescriptionController.value.text = product.description ?? '';
    ProductController.priceController.value.text = product.variations.isNotEmpty ? product.variations[0].price.toString() : '0.0';
    ProductController.timeRequiredController.value.text = '${product.timeRequired ?? 0} minutes';
    ProductController.selectSize.value = product.variations.length - 1; // Infer size based on variations count
    controller.selectedImages.clear(); // Clear any previously selected images

    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(
        vertical: 100.vpmm(context),
        horizontal: 16.hpmm(context),
      ),
      child: Container(
        width: 358.wm(context),
        height: 550.hm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
          borderRadius: BorderRadius.circular(16.rm(context)),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30.vpmm(context),
          horizontal: 20.hpmm(context),
        ),
        child: Material(
          color: Colors.transparent,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 138.hm(context),
                      width: 358.wm(context),
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SizedBox(
                            height: 138.hm(context),
                            width: 358.wm(context),
                          ),
                          Container(
                            height: 138.hm(context),
                            width: 358.wm(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rm(context)),
                              color: ColorUtils.white217,
                            ),
                            child: product.images.isNotEmpty
                                ? Image.network(
                              product.images[0],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(
                                Icons.broken_image,
                                size: 50.sm(context),
                                color: ColorUtils.gray136,
                              ),
                            )
                                : Center(
                              child: Icon(Icons.add, size: 36.sm(context), color: ColorUtils.blue192),
                            ),
                          ),
                          Container(
                            height: 138.hm(context),
                            width: 358.wm(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rm(context)),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 10.vpmm(context),
                              horizontal: 10.hpmm(context),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 24.hm(context),
                                  width: 24.wm(context),
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () {
                                      controller.selectedImages.clear();
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.deleteCircleIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          4,
                              (index) {
                            if (index == 0) {
                              return Container(
                                height: 60.hm(context),
                                width: 60.wm(context),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.rm(context)),
                                  color: ColorUtils.white217,
                                ),
                                margin: EdgeInsets.only(right: 10.rpmm(context)),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () async {
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                     // allowedExtensions: ['jpg', 'jpeg', 'png', 'svg'],
                                    );
                                    if (result != null) {
                                      controller.selectedImages.assignAll(result.files);
                                      print('Files selected: ${result.files.map((f) => f.name)}');
                                    }
                                  },
                                  child: Center(
                                    child: Icon(Icons.add, size: 24.sm(context), color: ColorUtils.blue192),
                                  ),
                                ),
                              );
                            } else {
                              return Obx(() {
                                final image = controller.selectedImages.length > index - 1
                                    ? controller.selectedImages[index - 1]
                                    : null;
                                return Container(
                                  height: 60.hm(context),
                                  width: 60.wm(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.rm(context)),
                                    color: ColorUtils.white217,
                                  ),
                                  margin: EdgeInsets.only(right: 10.rpmm(context)),
                                  child: image != null
                                      ? Image.file(
                                    File(image.path!),
                                    fit: BoxFit.cover,
                                  )
                                      : const SizedBox.shrink(),
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Meal Name *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.mealNameController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter meal name".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Meal Description *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.mealDescriptionController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter description here".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Price *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.priceController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "0.000".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Time Required *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                    TextFormField(
                      controller: ProductController.timeRequiredController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "00:00 minutes / hours".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                    Container(
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Meal Size *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          3,
                              (index) {
                            return Container(
                              height: 48.hm(context),
                              width: 96.wm(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rm(context)),
                                border: Border.all(
                                  color: ProductController.selectSize.value == index
                                      ? ColorUtils.blue192
                                      : ColorUtils.gray136,
                                  width: 1,
                                ),
                                color: ProductController.selectSize.value == index
                                    ? ColorUtils.white255
                                    : ColorUtils.white233,
                              ),
                              margin: EdgeInsets.only(right: 10.rpmm(context)),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () {
                                  ProductController.selectSize.value = index;
                                },
                                child: Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      index == 0 ? "SMALL".tr : index == 1 ? "MIDDLE".tr : "LARGE".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.spm(context),
                                        color: ProductController.selectSize.value == index
                                            ? ColorUtils.black51
                                            : ColorUtils.gray136,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 48.hm(context),
                          width: 153.wm(context),
                          decoration: BoxDecoration(
                            color: ColorUtils.blue192,
                            borderRadius: BorderRadius.circular(8.rm(context)),
                          ),
                          child: Obx(() => TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                              if (ProductController.mealNameController.value.text.isEmpty ||
                                  ProductController.mealDescriptionController.value.text.isEmpty ||
                                  ProductController.priceController.value.text.isEmpty ||
                                  ProductController.timeRequiredController.value.text.isEmpty) {
                                kSnackBar(
                                  message: 'Please fill all required fields.'.tr,
                                  bgColor: AppColors.red,
                                );
                                return;
                              }
                              double? price = double.tryParse(ProductController.priceController.value.text);
                              int? time = int.tryParse(ProductController.timeRequiredController.value.text.split(' ')[0]);
                              if (price == null || price <= 0) {
                                kSnackBar(
                                  message: 'Please enter a valid price.'.tr,
                                  bgColor: AppColors.red,
                                );
                                return;
                              }
                              if (time == null || time <= 0) {
                                kSnackBar(
                                  message: 'Please enter a valid time required.'.tr,
                                  bgColor: AppColors.red,
                                );
                                return;
                              }
                              await controller.updateProduct(
                                productId: product.id!,
                                name: ProductController.mealNameController.value.text,
                                description: ProductController.mealDescriptionController.value.text,
                                price: ProductController.priceController.value.text,
                                timeRequired: ProductController.timeRequiredController.value.text,
                                selectedSize: ProductController.selectSize.value,
                              );
                            },
                            child: Center(
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                color: ColorUtils.white255,
                                strokeWidth: 2.0,
                              )
                                  : Text(
                                "Save".tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.spm(context),
                                  color: ColorUtils.white255,
                                ),
                              ),
                            ),
                          )),
                        ),
                        SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                        Container(
                          height: 48.hm(context),
                          width: 153.wm(context),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.gray136, width: 1),
                            color: ColorUtils.white255,
                            borderRadius: BorderRadius.circular(8.rm(context)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: controller.isLoading.value ? null : () => Get.back(),
                            child: Center(
                              child: Text(
                                "Cancel".tr,
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class DeleteProductDialog extends StatelessWidget {
  final int index;

  DeleteProductDialog({required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    final product = controller.products[index];

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 224.vpmm(context),
        horizontal: 16.hpmm(context),
      ),
      child: Container(
        width: 358.wm(context),
        height: 448.hm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
          borderRadius: BorderRadius.circular(16.rm(context)),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30.vpmm(context),
          horizontal: 20.hpmm(context),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 64.hm(context),
                width: 64.wm(context),
                decoration: BoxDecoration(color: Colors.transparent),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    ImagePathUtils.errorIconImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),
              Container(
                width: 358.wm(context),
                alignment: Alignment.center,
                child: Text(
                  "Confirm Deletion".tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.spm(context),
                    color: ColorUtils.black33,
                    height: (35.hm(context) / 18.spm(context)),
                  ),
                ),
              ),
              Container(
                width: 358.wm(context),
                alignment: Alignment.center,
                child: Text(
                  "Are you sure you want to delete this meal from the menu? This action cannot be undone.".tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.spm(context),
                    color: ColorUtils.black33,
                    height: (35.hm(context) / 18.spm(context)),
                  ),
                ),
              ),
              SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48.hm(context),
                    width: 153.wm(context),
                    decoration: BoxDecoration(
                      color: ColorUtils.red211,
                      borderRadius: BorderRadius.circular(8.rm(context)),
                    ),
                    child: Obx(() => TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: controller.isLoading.value
                          ? null
                          : () async {
                        await controller.deleteProduct(product.id!);
                      },
                      child: Center(
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                          color: ColorUtils.white255,
                          strokeWidth: 2.0,
                        )
                            : Text(
                          "Delete".tr,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 18.spm(context),
                            color: ColorUtils.white255,
                          ),
                        ),
                      ),
                    )),
                  ),
                  SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                  Container(
                    height: 48.hm(context),
                    width: 153.wm(context),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorUtils.gray136, width: 1),
                      color: ColorUtils.white255,
                      borderRadius: BorderRadius.circular(8.rm(context)),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: controller.isLoading.value ? null : () => Get.back(),
                      child: Center(
                        child: Text(
                          "Cancel".tr,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}