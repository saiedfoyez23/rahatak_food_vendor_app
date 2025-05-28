import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/utils/assets_utils/screen_utils.dart';
import '../utils/assets_utils/color_utils.dart';
import '../utils/assets_utils/image_path_utils.dart';
import '../utils/widget_utils/spacer_widget.dart';
import '../controller/change_password_controller.dart';

class PasswordDialog extends StatelessWidget {
  final TextEditingController currentPasswordController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final RxBool currentObscureText;
  final RxBool obscureText;
  final RxBool confirmObscureText;

  const PasswordDialog({
    Key? key,
    required this.currentPasswordController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.currentObscureText,
    required this.obscureText,
    required this.confirmObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final ChangePasswordController controller = Get.put(ChangePasswordController());

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.2,
        horizontal: 16.hpmm(context),
      ),
      child: Container(
        width: double.infinity,
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Current Password
                PasswordTextField(
                  controller: currentPasswordController,
                  obscureText: currentObscureText,
                  hintText: "********",
                  labelText: "Current Password".tr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your current password".tr;
                    }
                    return null;
                  },
                ),
                SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),

                // New Password
                PasswordTextField(
                  controller: passwordController,
                  obscureText: obscureText,
                  hintText: "********",
                  labelText: "New Password".tr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a new password".tr;
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters".tr;
                    }
                    return null;
                  },
                ),
                SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),

                // Confirm Password
                PasswordTextField(
                  controller: confirmPasswordController,
                  obscureText: confirmObscureText,
                  hintText: "********",
                  labelText: "Confirm Password".tr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password".tr;
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match".tr;
                    }
                    return null;
                  },
                ),
                SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),

                // Buttons
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 48.hm(context),
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: controller.isLoading.value
                            ? ColorUtils.gray136
                            : ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(8.rm(context)),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            controller.changePassword(
                              oldPassword: currentPasswordController.text,
                              newPassword: passwordController.text,
                            );
                            Get.back();
                          }
                        },
                        child: Center(
                          child: controller.isLoading.value
                              ? CircularProgressIndicator(
                            color: ColorUtils.white255,
                            strokeWidth: 2,
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
                      ),
                    ),
                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
                    Container(
                      height: 48.hm(context),
                      width: MediaQuery.of(context).size.width * 0.3,
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
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable PasswordTextField Widget
class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final RxBool obscureText;
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity, // Use full width for responsiveness
            alignment: Directionality.of(context) == TextDirection.ltr
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Text(
              labelText.tr,
              textAlign: Directionality.of(context) == TextDirection.ltr
                  ? TextAlign.start
                  : TextAlign.end,
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
            style: obscureText.value
                ? GoogleFonts.openSans(
              fontSize: 16.spm(context),
              fontStyle: FontStyle.normal,
              color: ColorUtils.black51,
              fontWeight: FontWeight.w400,
            )
                : GoogleFonts.tajawal(
              fontSize: 16.spm(context),
              fontStyle: FontStyle.normal,
              color: ColorUtils.black51,
              fontWeight: FontWeight.w400,
            ),
            cursorHeight: 20.hm(context),
            obscureText: obscureText.value,
            textAlignVertical: TextAlignVertical.center,
            obscuringCharacter: "*",
            validator: validator,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                fontSize: 16.spm(context),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: ColorUtils.gray136,
              ),
              filled: true,
              suffixIcon: Container(
                height: 24.hm(context),
                width: 24.wm(context),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.hpmm(context),
                  vertical: 12.vpmm(context),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () => obscureText.value = !obscureText.value,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(
                      obscureText.value
                          ? ImagePathUtils.visibilityOffFocusIconImagePath
                          : ImagePathUtils.visibilityFocusIconImagePath,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              fillColor: ColorUtils.white255,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.hpmm(context),
                vertical: 12.vpmm(context),
              ),
              constraints: BoxConstraints(
                maxWidth: double.infinity,
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.rm(context)),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.rm(context)),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}