import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/widget/widget.dart';
import '../controller/category_controller.dart';
import '../controller/profile_controller.dart';
import '../screen/basic_information_screen.dart';
import '../screen/change_password.dart';
import '../screen/help_center_screen.dart';
import '../screen/login_screen.dart';
import '../screen/terms_and_conditions_screen.dart';
import '../utils/app_constant/app_constant.dart';
import '../utils/helper/local_store.dart';
import '../utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // Initialize controllers using Get.put()
  final CategoryController categoryController = Get.put(CategoryController());
  final ProfileController controller = Get.put(ProfileController(categoryController: Get.put(CategoryController())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator(color: AppColors.mainColor))
          : SafeArea(
        child: Container(
          height: 844.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(color: ColorUtils.white248),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Restaurant Management".tr,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                      child: Container(
                        width: 390.wm(context),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.white217, width: 0.5),
                          borderRadius: BorderRadius.circular(12.rm(context)),
                        ),
                        padding: EdgeInsets.only(
                          left: 20.lpmm(context),
                          right: 20.rpmm(context),
                          top: 20.tpmm(context),
                          bottom: 10.bpmm(context),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
                                height: 100.hm(context),
                                width: 100.wm(context),
                                decoration: BoxDecoration(color: Colors.transparent),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    SizedBox(
                                      height: 100.hm(context),
                                      width: 100.wm(context),
                                    ),
                                    Obx(() => controller.selectedImage.value == null
                                        ? Container(
                                      height: 100.hm(context),
                                      width: 100.wm(context),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white252,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorUtils.black025,
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 80.hm(context),
                                        width: 80.wm(context),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: controller.profile.value?.data?.store?.image != null
                                              ? Image.network("${controller.profile.value?.data?.store?.image}")
                                              : Image.asset(
                                            ImagePathUtils.noImageIconImagePath,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                        : Container(
                                      height: 100.hm(context),
                                      width: 100.wm(context),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white252,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(controller.selectedImage.value!),
                                          fit: BoxFit.fill,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorUtils.black025,
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                    )),
                                    Positioned(
                                      child: Container(
                                        height: 100.hm(context),
                                        width: 100.wm(context),
                                        decoration: BoxDecoration(color: Colors.transparent),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 30.hm(context),
                                              width: 30.wm(context),
                                              child: TextButton(
                                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                onPressed: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text('Select Profile Image'),
                                                        content: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: <Widget>[
                                                            ListTile(
                                                              leading: Icon(Icons.photo_library),
                                                              title: Text('Gallery'),
                                                              onTap: () async {
                                                                await controller.pickImage();
                                                                Get.back();
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: Icon(Icons.camera_alt),
                                                              title: Text('Camera'),
                                                              onTap: () async {
                                                                await controller.pickImage();
                                                                Get.back();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  height: 30.hm(context),
                                                  width: 30.wm(context),
                                                  decoration: BoxDecoration(color: Colors.transparent),
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Image.asset(
                                                      ImagePathUtils.editImageIconImagePath,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "${controller.profile.value?.data?.store?.name}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.spm(context),
                                  color: ColorUtils.black33,
                                  height: (20.hm(context) / 20.spm(context)),
                                ),
                              ),
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "${controller.profile.value?.data?.store?.contact}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black33,
                                  height: (20.hm(context) / 16.spm(context)),
                                ),
                              ),
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
                          ],
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                      child: Container(
                        width: 390.wm(context),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.white217, width: 0.5),
                          borderRadius: BorderRadius.circular(12.rm(context)),
                        ),
                        padding: EdgeInsets.only(
                          left: 20.lpmm(context),
                          right: 20.rpmm(context),
                          top: 20.tpmm(context),
                          bottom: 10.bpmm(context),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Basic Information".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black51,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 24.hm(context),
                                  width: 24.wm(context),
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () {
                                      showAdaptiveDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) => EditRestaurantDialog(),
                                      );
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        ImagePathUtils.editIconImagePath,
                                        fit: BoxFit.fill,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 14.hm(context)),
                            _buildTextField(
                              context,
                              "Restaurant Name".tr,
                              controller.restaurantNameController.value,
                              hint: "${controller.profile.value?.data?.store?.name}",
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                            _buildTextField(
                              context,
                              "Email Address".tr,
                              controller.emailAddressController.value,
                              hint: "${controller.profile.value?.data?.email}",
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                            _buildTextField(
                              context,
                              "Phone Number".tr,
                              controller.phoneNumberController.value,
                              hint: "${controller.profile.value?.data?.store?.contact}",
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                            _buildTextField(
                              context,
                              "Bank account".tr,
                              controller.bankAccountController.value,
                              hint: "${controller.profile.value?.data?.bankAccount}",
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                          ],
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                      child: Container(
                        width: 390.wm(context),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.white217, width: 0.5),
                          borderRadius: BorderRadius.circular(12.rm(context)),
                        ),
                        padding: EdgeInsets.only(
                          left: 20.lpmm(context),
                          right: 20.rpmm(context),
                          top: 20.tpmm(context),
                          bottom: 10.bpmm(context),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Location Management".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black51,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 24.hm(context),
                                  width: 24.wm(context),
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () {
                                      showAdaptiveDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) => _buildLocationDialog(context),
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
                              ],
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 14.hm(context)),
                            _buildTextField(
                              context,
                              "Governorate".tr,
                              controller.governorateController.value,
                              hint: "${controller.profile.value?.data?.store?.locations[0].governorate}",
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                            _buildTextField(
                              context,
                              "State".tr,
                              controller.stateController.value,
                              hint: "${controller.profile.value?.data?.store?.locations[0].state}",
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                          ],
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                      child: Container(
                        width: 390.wm(context),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.white217, width: 0.5),
                          borderRadius: BorderRadius.circular(12.rm(context)),
                        ),
                        padding: EdgeInsets.only(
                          left: 20.lpmm(context),
                          right: 20.rpmm(context),
                          top: 20.tpmm(context),
                          bottom: 10.bpmm(context),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Additional Information".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black51,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 24.hm(context),
                                  width: 24.wm(context),
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () {
                                      showAdaptiveDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) => _buildAdditionalInfoDialog(context),
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
                              ],
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 14.hm(context)),
                            _buildTextField(
                              context,
                              "Restaurant Classification".tr,
                              controller.restaurantClassificationController.value,
                              hint: "Shawarma".tr,
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                            _buildTextField(
                              context,
                              "Working Hours".tr,
                              controller.workingHoursController.value,
                              hint: "From ${controller.startTimeController.value.text} to ${controller.endTimeController.value.text}".tr,
                              enabled: false,
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),
                          ],
                        ),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                      child: Column(
                        children: [
                          _buildMenuItem(context, "Change Password".tr, ImagePathUtils.changePasswordIconImagePath, () {
                            showAdaptiveDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => PasswordDialog(
                                currentPasswordController: controller.currentPasswordController.value,
                                passwordController: controller.passwordController.value,
                                confirmPasswordController: controller.confirmPasswordController.value,
                                currentObscureText: controller.currentObscureText,
                                obscureText: controller.obscureText,
                                confirmObscureText: controller.confirmObscureText,
                              ),
                            );
                          }),
                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                          _buildMenuItem(context, "Change App Language".tr, ImagePathUtils.languageChangeIconImagePath, () {
                            showAdaptiveDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => _buildLanguageDialog(context),
                            );
                          }),
                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                          _buildMenuItem(context, "Terms and Conditions".tr, ImagePathUtils.termsAndConditionIconImagePath, () {
                            Get.off(() => TermsAndConditionsScreen(),
                                duration: Duration(milliseconds: 300), transition: Transition.fadeIn, preventDuplicates: false);
                          }),
                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
                          _buildMenuItem(context, "Help Center".tr, ImagePathUtils.helpCenterIconImagePath, () {
                            Get.off(() => HelpCenterScreen(),
                                duration: Duration(milliseconds: 300), transition: Transition.fadeIn, preventDuplicates: false);
                          }),
                        ],
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),
                    Container(
                      height: 48.hm(context),
                      width: 300.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.red211,
                        borderRadius: BorderRadius.circular(8.rm(context)),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          LocalStorage.removeData(key: AppConstant.token);
                          Get.off(() => LoginScreen(),
                              duration: Duration(milliseconds: 300), transition: Transition.fadeIn, preventDuplicates: false);
                        },
                        child: Center(
                          child: Text(
                            "Sign out".tr,
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
                    SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: false,
        isMenuFocus: false,
        isOrderFocus: false,
        isProfileFocus: true,
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, TextEditingController controller,
      {String hint = '', bool enabled = true}) {
    return Column(
      crossAxisAlignment: Get.locale.toString() == "en" ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          width: 358.wm(context),
          alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
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
          enabled: enabled,
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
            hintText: hint,
            hintStyle: GoogleFonts.tajawal(
              fontSize: 16.spm(context),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: ColorUtils.gray136,
            ),
            filled: true,
            fillColor: enabled ? ColorUtils.white243 : ColorUtils.white255,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.hpmm(context), vertical: 12.vpmm(context)),
            constraints: BoxConstraints(maxWidth: 358.wm(context), maxHeight: 48.hm(context)),
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

  Widget _buildMenuItem(BuildContext context, String title, String iconPath, VoidCallback onTap) {
    return SizedBox(
      height: 54.hm(context),
      width: 390.wm(context),
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onTap,
        child: Container(
          height: 54.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(color: Colors.transparent),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 24.hm(context),
                      width: 24.wm(context),
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(iconPath),
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 20.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),
              Container(
                height: 24.hm(context),
                width: 24.wm(context),
                decoration: BoxDecoration(color: Colors.transparent),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(
                    Get.locale.toString() == "en"
                        ? ImagePathUtils.arrowFilledIconImagePath
                        : ImagePathUtils.arrowFilledBackIconImagePath,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationDialog(BuildContext context) {
    return Obx(
          () => Padding(
        padding: EdgeInsets.symmetric(vertical: 140.vpmm(context), horizontal: 16.hpmm(context)),
        child: Container(
          width: 358.wm(context),
          height: 500.hm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
            borderRadius: BorderRadius.circular(16.rm(context)),
          ),
          padding: EdgeInsets.symmetric(vertical: 30.vpmm(context), horizontal: 20.hpmm(context)),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextField(context, "Governorate".tr, controller.governorateController.value, hint: "Muscat Governorate".tr),
                SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                _buildTextField(context, "State".tr, controller.stateController.value, hint: "Al Khoudh".tr),
                SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                _buildTextField(context, "Location Link".tr, controller.locationLinkController.value, hint: "Location Link".tr),
                SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
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
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          await controller.updateProfile();
                          Get.back();
                        },
                        child: Center(
                          child: Text(
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
                      ),
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
                        onPressed: () => Get.back(),
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
      ),
    );
  }

  Widget _buildAdditionalInfoDialog(BuildContext context) {
    return Obx(
          () => Padding(
        padding: EdgeInsets.symmetric(vertical: 40.vpmm(context), horizontal: 16.hpmm(context)),
        child: Container(
          width: 358.wm(context),
          height: 500.hm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
            borderRadius: BorderRadius.circular(16.rm(context)),
          ),
          padding: EdgeInsets.symmetric(vertical: 30.vpmm(context), horizontal: 20.hpmm(context)),
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
                        width: 358.wm(context),
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "Restaurant Category *".tr,
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
                      SizedBox(
                        width: 390.wm(context),
                        child: Wrap(
                          children: List.generate(categoryController.categoryNames.length, (index) {
                            return SizedBox(
                              height: 70.hm(context),
                              width: 105.wm(context),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                child: Container(
                                  height: 70.hm(context),
                                  width: 105.wm(context),
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  margin: EdgeInsets.only(bottom: 2.bpmm(context), right: 2.rpmm(context)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 18.hm(context),
                                        width: 18.wm(context),
                                        decoration: BoxDecoration(color: Colors.transparent),
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                            ImagePathUtils.uncheckBoxImagePath,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                      SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),
                                      Expanded(
                                        child: Container(
                                          alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                          child: Text(
                                            "${categoryController.categoryNames[index]}".tr,
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.spm(context),
                                              color: ColorUtils.black51,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                      Container(
                        width: 358.wm(context),
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "Working Hours *".tr,
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
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.pickStartTime(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.hpmm(context),
                                  vertical: 12.vpmm(context),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorUtils.white255,
                                  border: Border.all(color: ColorUtils.gray163, width: 1),
                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                ),
                                constraints: BoxConstraints(maxHeight: 48.hm(context)),
                                child: Obx(() => Text(
                                  controller.startTime.value == null
                                      ? "04:00 PM".tr
                                      : controller.startTime.value!.format(context),
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.spm(context),
                                    fontStyle: FontStyle.normal,
                                    color: controller.startTime.value == null ? ColorUtils.gray136 : ColorUtils.black51,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.wm(context)),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.pickEndTime(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.hpmm(context),
                                  vertical: 12.vpmm(context),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorUtils.white255,
                                  border: Border.all(color: ColorUtils.gray163, width: 1),
                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                ),
                                constraints: BoxConstraints(maxHeight: 48.hm(context)),
                                child: Obx(() => Text(
                                  controller.endTime.value == null
                                      ? "11:00 PM".tr
                                      : controller.endTime.value!.format(context),
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.spm(context),
                                    fontStyle: FontStyle.normal,
                                    color: controller.endTime.value == null ? ColorUtils.gray136 : ColorUtils.black51,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
                      Container(
                        height: 162.hm(context),
                        width: 358.wm(context),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            SizedBox(height: 162.hm(context), width: 358.wm(context)),
                            Container(
                              height: 162.hm(context),
                              width: 358.wm(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rm(context)),
                                color: ColorUtils.white217,
                              ),
                              child: Obx(() => controller.selectedCover.value == null
                                  ? Image.asset(ImagePathUtils.restaurantOneImage, fit: BoxFit.fill)
                                  : Image.file(controller.selectedCover.value!, fit: BoxFit.fill)),
                            ),
                            Container(
                              height: 162.hm(context),
                              width: 358.wm(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rm(context)),
                                color: Colors.transparent,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 30.vpmm(context), horizontal: 10.hpmm(context)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 24.hm(context),
                                        width: 24.wm(context),
                                        decoration: BoxDecoration(color: Colors.transparent),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () => controller.pickCover(),
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.asset(ImagePathUtils.plusIconImagePath, fit: BoxFit.fill, alignment: Alignment.center),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4.wm(context)),
                                      Container(
                                        height: 24.hm(context),
                                        width: 24.wm(context),
                                        decoration: BoxDecoration(color: Colors.transparent),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () {
                                            controller.selectedCover.value = null;
                                          },
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.asset(ImagePathUtils.deleteCircleIconImagePath, fit: BoxFit.fill, alignment: Alignment.center),
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
                      SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
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
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                await controller.updateProfile();
                                Get.back();
                              },
                              child: Center(
                                child: Text(
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
                            ),
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
                              onPressed: () => Get.back(),
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
      ),
    );
  }

  Widget _buildLanguageDialog(BuildContext context) {
    return Obx(
          () => Padding(
        padding: EdgeInsets.symmetric(vertical: 265.vpmm(context), horizontal: 16.hpmm(context)),
        child: Container(
          width: 358.wm(context),
          height: 290.hm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
            borderRadius: BorderRadius.circular(16.rm(context)),
          ),
          padding: EdgeInsets.symmetric(vertical: 30.vpmm(context), horizontal: 20.hpmm(context)),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 56.hm(context),
                  width: 358.wm(context),
                  decoration: BoxDecoration(
                    border: controller.isArabic.value == false
                        ? Border.all(color: ColorUtils.white217, width: 1)
                        : Border.all(color: ColorUtils.blue192, width: 1),
                    borderRadius: BorderRadius.circular(10.rm(context)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.vpmm(context), horizontal: 12.hpmm(context)),
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      if (controller.isArabic.value == true) {
                        controller.isArabic.value = false;
                        controller.isEnglish.value = false;
                      } else {
                        controller.isArabic.value = true;
                        controller.isEnglish.value = false;
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 30.hm(context),
                          width: 30.wm(context),
                          decoration: BoxDecoration(
                            border: controller.isArabic.value == false
                                ? Border.all(color: ColorUtils.white217, width: 1)
                                : Border.all(color: ColorUtils.blue192, width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              height: 16.hm(context),
                              width: 16.wm(context),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.isArabic.value == false ? Colors.transparent : ColorUtils.blue192,
                              ),
                            ),
                          ),
                        ),
                        SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                        Expanded(
                          child: Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Arabic Language".tr,
                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
                Container(
                  height: 56.hm(context),
                  width: 358.wm(context),
                  decoration: BoxDecoration(
                    border: controller.isEnglish.value == false
                        ? Border.all(color: ColorUtils.white217, width: 1)
                        : Border.all(color: ColorUtils.blue192, width: 1),
                    borderRadius: BorderRadius.circular(10.rm(context)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.vpmm(context), horizontal: 12.hpmm(context)),
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      if (controller.isEnglish.value == true) {
                        controller.isArabic.value = false;
                        controller.isEnglish.value = false;
                      } else {
                        controller.isArabic.value = false;
                        controller.isEnglish.value = true;
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 30.hm(context),
                          width: 30.wm(context),
                          decoration: BoxDecoration(
                            border: controller.isEnglish.value == false
                                ? Border.all(color: ColorUtils.white217, width: 1)
                                : Border.all(color: ColorUtils.blue192, width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              height: 16.hm(context),
                              width: 16.wm(context),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.isEnglish.value == false ? Colors.transparent : ColorUtils.blue192,
                              ),
                            ),
                          ),
                        ),
                        SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                        Expanded(
                          child: Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "English Language".tr,
                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                        color: ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(8.rm(context)),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          if (controller.isEnglish.value) {
                            Get.updateLocale(Locale("en"));
                          } else if (controller.isArabic.value) {
                            Get.updateLocale(Locale("ar"));
                          }
                          Get.back();
                        },
                        child: Center(
                          child: Text(
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
                      ),
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
                        onPressed: () => Get.back(),
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
      ),
    );
  }
}