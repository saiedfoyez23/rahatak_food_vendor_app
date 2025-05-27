import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/controller/registration_controller.dart';
import '../screen/screen.dart';
import '../utils/app_color/app_colors.dart';
import '../utils/utils.dart';
import 'custom_snackbar.dart';


class RegistrationScreenWidget extends GetxController {
  Rx<TextEditingController> restaurantNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> bankAccountController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> locationLinkController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool obscureText = true.obs;
  RxBool isCheckIn = false.obs;
  RxString selectedGovernorate = 'muscat'.obs;
  final List<String> governorates = [
    "muscat",
    "al-batinah",
    "musandam",
    "al-wusta",
    "ad-dakhiliyah",
    "al-dhahirah",
    "sharkia",
    "dhofar"
  ];

  final RegistrationController _registrationController = Get.put(RegistrationController());

  Widget registrationScreenWidget({required BuildContext context}) {
    return Obx(() => SafeArea(
      child: Container(
        height: MediaQuery.sizeOf(context).height > 1000 ? 1133.ht(context) : 844.hm(context),
        width: MediaQuery.sizeOf(context).width > 500 ? 744.wt(context) : 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height > 1000 ?
                  37.hpmt(context) :
                  16.hpmm(context),
                ),
                child: Column(
                  children: [
                    SpacerWidget.spacerWidget(
                      spaceHeight: MediaQuery.sizeOf(context).height > 1000 ?
                      11.ht(context) :
                      11.hm(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height > 1000 ? 28.ht(context) : 24.hm(context),
                          width: MediaQuery.sizeOf(context).width > 500 ? 28.wt(context) : 24.wm(context),
                          decoration: BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.sizeOf(context).height > 1000 ? 50.tpmt(context) : 45.tpmm(context),
                                        bottom: MediaQuery.sizeOf(context).height > 1000 ? 941.tpmt(context) : 667.tpmm(context),
                                        left: Get.locale.toString() == "en" ?
                                        MediaQuery.sizeOf(context).width > 500 ? 37.lpmt(context) : 16.lpmm(context) :
                                        MediaQuery.sizeOf(context).width > 500 ? 557.rpmt(context) : 232.rpmm(context),
                                        right: Get.locale.toString() == "en" ?
                                        MediaQuery.sizeOf(context).width > 500 ? 557.rpmt(context) : 232.rpmm(context) :
                                        MediaQuery.sizeOf(context).width > 500 ? 37.lpmt(context) : 16.lpmm(context)
                                    ),
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).height > 1000 ? 88.ht(context) : 88.hm(context),
                                      width: MediaQuery.sizeOf(context).width > 500 ? 150.wt(context) : 150.wm(context),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white255,
                                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 10.rt(context) : 10.rm(context)),
                                        boxShadow: [
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
                                        children: [
                                          Container(
                                            height: MediaQuery.sizeOf(context).height > 1000 ? 42.ht(context) : 42.hm(context),
                                            width: MediaQuery.sizeOf(context).width > 500 ? 150.wt(context) : 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.updateLocale(Locale("ar"));
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Arabic".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.sizeOf(context).height > 1000 ? 42.ht(context) : 42.hm(context),
                                            width: MediaQuery.sizeOf(context).width > 500 ? 150.wt(context) : 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.updateLocale(Locale("en"));
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "English".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                ImagePathUtils.languageButtonImagePath,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 127.ht(context) : 44.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "Join Rahtak and start receiving orders now!".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 24.spt(context) : 24.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 45.ht(context) : 32.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Restaurant Name *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    TextFormField(
                      controller: restaurantNameController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your restaurant name".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Email *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    TextFormField(
                      controller: emailController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your email".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Phone Number *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    TextFormField(
                      controller: phoneNumberController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your phone number".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Bank account *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    TextFormField(
                      controller: bankAccountController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your bank account".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Governorate *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      height: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.gray163, width: 1),
                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                        color: ColorUtils.white255,
                      ),
                      child: Obx(() => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedGovernorate.value,
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          items: governorates.map((String governorate) {
                            return DropdownMenuItem<String>(
                              value: governorate,
                              child: Text(
                                governorate.tr,
                                style: GoogleFonts.tajawal(
                                  fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                                  fontStyle: FontStyle.normal,
                                  color: ColorUtils.black51,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              selectedGovernorate.value = newValue;
                              print('Selected Governorate: $newValue');
                            }
                          },
                          style: GoogleFonts.tajawal(
                            fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                            color: ColorUtils.black51,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: ColorUtils.gray136,
                            size: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context),
                          ),
                        ),
                      )),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "State *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    TextFormField(
                      controller: stateController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your state".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Location Link *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    TextFormField(
                      controller: locationLinkController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter location link".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Password".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),
                    TextFormField(
                      controller: passwordController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      style: obscureText.value == true ?
                      GoogleFonts.openSans(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ) :
                      GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      obscureText: obscureText.value,
                      textAlignVertical: TextAlignVertical.center,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "********",
                        hintStyle: GoogleFonts.openSans(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        suffixIcon: Container(
                          height: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context),
                          width: MediaQuery.sizeOf(context).width > 500 ? 24.wt(context) : 24.wm(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                            vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              if(obscureText.value == true) {
                                obscureText.value = false;
                              } else {
                                obscureText.value = true;
                              }
                            },
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                obscureText.value == true ?
                                ImagePathUtils.visibilityOffFocusIconImagePath :
                                ImagePathUtils.visibilityFocusIconImagePath,
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192, width: 1),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),
                    Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 25.ht(context) : 25.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          if(isCheckIn.value == true) {
                            isCheckIn.value = false;
                          } else {
                            isCheckIn.value = true;
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height > 1000 ? 18.ht(context) : 18.hm(context),
                              width: MediaQuery.sizeOf(context).width > 500 ? 18.wt(context) : 18.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                  isCheckIn.value == true ?
                                  ImagePathUtils.checkBoxImagePath :
                                  ImagePathUtils.uncheckBoxImagePath,
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            SpacerWidget.spacerWidget(spaceWidth: MediaQuery.sizeOf(context).width > 500 ? 8.wt(context) : 8.wm(context)),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "I agree to ".tr,
                                style: GoogleFonts.tajawal(
                                  fontStyle: FontStyle.normal,
                                  fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                  color: ColorUtils.black51,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: "the terms and conditions".tr,
                                    style: GoogleFonts.tajawal(
                                      fontStyle: FontStyle.normal,
                                      fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                      color: ColorUtils.blue192,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 48.ht(context) : 45.hm(context)),
                 Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 300.wt(context) : 300.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                      ),
                      child:   TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          if (!isCheckIn.value) {
                            kSnackBar(message: "Please agree to the terms and conditions".tr, bgColor: AppColors.red);
                            return;
                          }
                          if (restaurantNameController.value.text.isEmpty ||
                              emailController.value.text.isEmpty ||
                              phoneNumberController.value.text.isEmpty ||
                              bankAccountController.value.text.isEmpty ||
                              stateController.value.text.isEmpty ||
                              locationLinkController.value.text.isEmpty ||
                              passwordController.value.text.isEmpty) {
                            kSnackBar(message: "Please fill all required fields".tr, bgColor: AppColors.red);
                            return;
                          }

                          await _registrationController.register(
                            email: emailController.value.text,
                            password: passwordController.value.text,
                            storeName: restaurantNameController.value.text,
                            contact: phoneNumberController.value.text,
                            bankAccount: bankAccountController.value.text,
                            governorate: selectedGovernorate.value,
                            state: stateController.value.text,
                            locationLink: locationLinkController.value.text,
                          );

                          // Future.delayed(Duration(seconds: 5), () async {
                          //   Get.back();
                          //
                          //   // Navigation to LoginScreen is handled in RegistrationController if successful
                          // });
                        },
                        child: Center(
                          child: _registrationController.isLoading.value == true? SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(color: AppColors.white,)) :  Text(
                            "Create account".tr,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 18.spm(context),
                              color: ColorUtils.white255,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 28.ht(context) : 28.hm(context)),
                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Already have an account? ".tr,
                          style: GoogleFonts.tajawal(
                            fontStyle: FontStyle.normal,
                            fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                            color: ColorUtils.black255,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Login ".tr,
                              style: GoogleFonts.tajawal(
                                fontStyle: FontStyle.normal,
                                fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                color: ColorUtils.black51,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Get.off(() => LoginScreen(), duration: Duration(milliseconds: 300), transition: Transition.fadeIn, preventDuplicates: false);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}