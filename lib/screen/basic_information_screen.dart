import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/utils/assets_utils/screen_utils.dart';
import '../controller/edit_restaurant_controller.dart';
import '../utils/assets_utils/color_utils.dart';
import '../utils/widget_utils/spacer_widget.dart';

class EditRestaurantDialog extends StatelessWidget {
  final EditRestaurantController controller = Get.put(EditRestaurantController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 140.vpmm(context),
          horizontal: 16.hpmm(context),
        ),
        child: Container(
          width: 358.wm(context),
          height: 450.hm(context),
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
                _buildTextFieldSection(
                  context,
                  label: "Restaurant Name *".tr,
                  controller: controller.restaurantNameController.value,
                  hintText: "Shawaremac".tr,
                ),
                SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                _buildTextFieldSection(
                  context,
                  label: "Phone Number *".tr,
                  controller: controller.phoneNumberController.value,
                  hintText: "+968 91234567".tr,
                ),
                // SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                // _buildTextFieldSection(
                //   context,
                //   label: "Email Address *".tr,
                //   controller: controller.emailAddressController.value,
                //   hintText: "shawaremak@gmail.com".tr,
                // ),
                SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                _buildTextFieldSection(
                  context,
                  label: "Bank account *".tr,
                  controller: controller.bankAccountController.value,
                  hintText: "0334 7878 0988 0032".tr,
                ),
                SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                _buildActionButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldSection(
      BuildContext context, {
        required String label,
        required TextEditingController controller,
        required String hintText,
      }) {
    return Column(
      children: [
        Container(
          width: 358.wm(context),
          alignment: Get.locale.toString() == "en"
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            label,
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
          controller: controller,
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
            hintText: hintText,
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
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
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
            onPressed: controller.isLoading.value ? null : controller.save,
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
            onPressed: controller.isLoading.value ? null : controller.cancel,
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
    );
  }
}