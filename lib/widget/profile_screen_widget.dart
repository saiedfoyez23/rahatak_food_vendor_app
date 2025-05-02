import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahatak_food_vendor_app/utils/utils.dart';

import '../screen/screen.dart';

class ProfileScreenWidget extends GetxController {

  RxBool isEnglish = false.obs;

  RxBool isArabic = false.obs;

  Rx<File> imageFile = File("").obs;


  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool obscureText = true.obs;
  Rx<TextEditingController> currentPasswordController = TextEditingController().obs;
  RxBool currentObscureText = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool confirmObscureText = true.obs;


  Rx<TextEditingController> restaurantNameController = TextEditingController().obs;
  Rx<TextEditingController> emailAddressController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> bankAccountController = TextEditingController().obs;


  RxInt bigIndex_1 = 0.obs;

  RxList<String> locations = <String>[
    "Muscat",
    "Al Batinah",
    "Ad Dakhiliyah",
    "Musandam",
    "Al Buraimi",
    "Sharkia",
    "Al Dhahirah",
    "Al Wusta",
    "Dhofar",
  ].obs;


  Widget profileScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1133) {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white248,
    //       ),
    //       child: CustomScrollView(
    //         slivers: [
    //
    //
    //           SliverToBoxAdapter(
    //             child: Column(
    //               children: [
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
    //
    //
    //                 Container(
    //                   alignment: Alignment.center,
    //                   child: Text(
    //                     "Restaurant Management".tr,
    //                     textAlign: TextAlign.center,
    //                     style: GoogleFonts.tajawal(
    //                       fontWeight: FontWeight.w700,
    //                       fontStyle: FontStyle.normal,
    //                       fontSize: 20.spt(context),
    //                       color: ColorUtils.black255,
    //                     ),
    //                   ),
    //                 ),
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 36.ht(context)),
    //
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 138.hpmt(context),
    //                   ),
    //                   child: Container(
    //                     width: 744.wt(context),
    //                     decoration: BoxDecoration(
    //                       border: Border.all(color: ColorUtils.white217,width: .5),
    //                       borderRadius: BorderRadius.circular(12.rt(context)),
    //                     ),
    //                     padding: EdgeInsets.only(
    //                       left: 20.lpmt(context),
    //                       right: 20.rpmt(context),
    //                       top: 20.tpmt(context),
    //                       bottom: 10.bpmt(context),
    //                     ),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //
    //                         Directionality(
    //                           textDirection: TextDirection.ltr,
    //                           child: Container(
    //                             height: 100.ht(context),
    //                             width: 100.wt(context),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: Stack(
    //                               fit: StackFit.expand,
    //                               children: [
    //
    //                                 SizedBox(
    //                                   height: 100.ht(context),
    //                                   width: 100.wt(context),
    //                                 ),
    //
    //
    //                                 imageFile.value.path == "" ?
    //                                 Container(
    //                                   height: 100.ht(context),
    //                                   width: 100.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: ColorUtils.white252,
    //                                     shape: BoxShape.circle,
    //                                     boxShadow: [
    //                                       BoxShadow(
    //                                           color: ColorUtils.black025,
    //                                           spreadRadius: 0,
    //                                           blurRadius: 4,
    //                                           offset: Offset(0, 0)
    //                                       )
    //                                     ],
    //                                   ),
    //                                   alignment: Alignment.center,
    //                                   child: Container(
    //                                     height: 59.ht(context),
    //                                     width: 59.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.cover,
    //                                       child: Image.asset(
    //                                         ImagePathUtils.noImageIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ) :
    //                                 Container(
    //                                   height: 100.ht(context),
    //                                   width: 100.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: ColorUtils.white252,
    //                                     shape: BoxShape.circle,
    //                                     image: DecorationImage(
    //                                       image: FileImage(imageFile.value,),
    //                                       fit: BoxFit.fill,
    //                                     ),
    //                                     boxShadow: [
    //                                       BoxShadow(
    //                                           color: ColorUtils.black025,
    //                                           spreadRadius: 0,
    //                                           blurRadius: 4,
    //                                           offset: Offset(0, 0)
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ),
    //
    //
    //                                 Positioned(
    //                                   child: Container(
    //                                     height: 100.ht(context),
    //                                     width: 100.wt(context),
    //                                     decoration: BoxDecoration(
    //                                         color: Colors.transparent
    //                                     ),
    //                                     child: Column(
    //                                       mainAxisAlignment: MainAxisAlignment.end,
    //                                       crossAxisAlignment: CrossAxisAlignment.end,
    //                                       children: [
    //
    //                                         SizedBox(
    //                                           height: 30.ht(context),
    //                                           width: 30.wt(context),
    //                                           child: TextButton(
    //                                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                             onPressed: () async {
    //                                               showDialog(
    //                                                 context: context,
    //                                                 builder: (BuildContext context) {
    //                                                   return AlertDialog(
    //                                                     title: Text('Select Profile Image'),
    //                                                     content: Column(
    //                                                       mainAxisSize: MainAxisSize.min,
    //                                                       children: <Widget>[
    //                                                         ListTile(
    //                                                           leading: Icon(Icons.photo_library),
    //                                                           title: Text('Gallery'),
    //                                                           onTap: () async {
    //                                                             final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //                                                             if (pickedFile != null) {
    //                                                               print('Image selected: ${pickedFile.path}');
    //                                                               imageFile.value = File(pickedFile.path);
    //                                                             } else {
    //                                                               ScaffoldMessenger.of(context).showSnackBar(
    //                                                                 SnackBar(
    //                                                                   content: Text('No image selected'),
    //                                                                   duration: Duration(seconds: 2),
    //                                                                 ),
    //                                                               );
    //                                                             }
    //                                                             Get.back();
    //                                                           },
    //                                                         ),
    //                                                         ListTile(
    //                                                           leading: Icon(Icons.camera_alt),
    //                                                           title: Text('Camera'),
    //                                                           onTap: () async {
    //                                                             final pickedFile = await ImagePicker().pickImage(
    //                                                                 source: ImageSource.camera);
    //                                                             if (pickedFile != null) {
    //                                                               imageFile.value = File(pickedFile.path);
    //                                                               print('Image selected: ${pickedFile.path}');
    //                                                             } else {
    //                                                               ScaffoldMessenger.of(context).showSnackBar(
    //                                                                 SnackBar(
    //                                                                   content: Text('No image selected'),
    //                                                                   duration: Duration(seconds: 2),
    //                                                                 ),
    //                                                               );
    //                                                             }
    //                                                             Get.back();
    //                                                           },
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   );
    //                                                 },
    //                                               );
    //
    //                                             },
    //                                             child: Container(
    //                                               height: 30.ht(context),
    //                                               width: 30.wt(context),
    //                                               decoration: BoxDecoration(
    //                                                 color: Colors.transparent,
    //                                               ),
    //                                               child: FittedBox(
    //                                                 fit: BoxFit.cover,
    //                                                 child: Image.asset(
    //                                                   ImagePathUtils.editImageIconImagePath,
    //                                                   fit: BoxFit.cover,
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 )
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
    //
    //
    //                         Container(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             "Mohammed Ali".tr,
    //                             textAlign: TextAlign.center,
    //                             style: GoogleFonts.tajawal(
    //                               fontWeight: FontWeight.w700,
    //                               fontStyle: FontStyle.normal,
    //                               fontSize: 20.spt(context),
    //                               color: ColorUtils.black33,
    //                               height: (20.ht(context) / 20.spt(context)),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //
    //                         Container(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             "1234565".tr,
    //                             textAlign: TextAlign.center,
    //                             style: GoogleFonts.tajawal(
    //                               fontWeight: FontWeight.w500,
    //                               fontStyle: FontStyle.normal,
    //                               fontSize: 16.spt(context),
    //                               color: ColorUtils.black33,
    //                               height: (20.ht(context) / 16.spt(context)),
    //                             ),
    //                           ),
    //                         ),
    //
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 138.hpmt(context),
    //                   ),
    //                   child: Container(
    //                     width: 744.wt(context),
    //                     decoration: BoxDecoration(
    //                       border: Border.all(color: ColorUtils.white217,width: .5),
    //                       borderRadius: BorderRadius.circular(12.rt(context)),
    //                     ),
    //                     padding: EdgeInsets.only(
    //                       left: 20.lpmt(context),
    //                       right: 20.rpmt(context),
    //                       top: 20.tpmt(context),
    //                       bottom: 10.bpmt(context),
    //                     ),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //
    //
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //
    //
    //                             Expanded(
    //                               child: Container(
    //                                 alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                 child: Text(
    //                                   "Basic Information".tr,
    //                                   textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                   style: GoogleFonts.tajawal(
    //                                     fontWeight: FontWeight.w700,
    //                                     fontStyle: FontStyle.normal,
    //                                     fontSize: 18.spt(context),
    //                                     color: ColorUtils.black51,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //
    //                             Container(
    //                               height: 28.ht(context),
    //                               width: 28.wt(context),
    //                               decoration: BoxDecoration(
    //                                 color: Colors.transparent,
    //                               ),
    //                               child: TextButton(
    //                                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                 onPressed: () {
    //                                   showAdaptiveDialog(
    //                                     context: context,
    //                                     barrierDismissible: true,
    //                                     builder: (context) {
    //                                       return Obx(()=>Padding(
    //                                         padding: EdgeInsets.symmetric(
    //                                           vertical: 140.vpmt(context),
    //                                           horizontal: 138.hpmt(context),
    //                                         ),
    //                                         child: Container(
    //                                           width: 468.wt(context),
    //                                           height: 650.ht(context),
    //                                           decoration: BoxDecoration(
    //                                             color: ColorUtils.white255,
    //                                             borderRadius: BorderRadius.circular(16.rt(context)),
    //                                           ),
    //                                           padding: EdgeInsets.symmetric(
    //                                             vertical: 30.vpmt(context),
    //                                             horizontal: 20.hpmt(context),
    //                                           ),
    //                                           child: Material(
    //                                             color: Colors.transparent,
    //                                             child: CustomScrollView(
    //                                               slivers: [
    //
    //
    //                                                 SliverToBoxAdapter(
    //                                                   child: Column(
    //                                                     mainAxisAlignment: MainAxisAlignment.center,
    //                                                     crossAxisAlignment: CrossAxisAlignment.center,
    //                                                     children: [
    //
    //
    //                                                       Container(
    //                                                         width: 468.wt(context),
    //                                                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                                         child: Text(
    //                                                           "Restaurant Name *".tr,
    //                                                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                                           style: GoogleFonts.tajawal(
    //                                                             fontWeight: FontWeight.w700,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             fontSize: 16.spt(context),
    //                                                             color: ColorUtils.black33,
    //                                                           ),
    //                                                         ),
    //                                                       ),
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                                                       TextFormField(
    //                                                         controller: restaurantNameController.value,
    //                                                         textAlign: TextAlign.start,
    //                                                         cursorColor: ColorUtils.blue192,
    //                                                         cursorHeight: 20.ht(context),
    //                                                         style: GoogleFonts.tajawal(
    //                                                           fontSize: 16.spt(context),
    //                                                           fontStyle: FontStyle.normal,
    //                                                           color: ColorUtils.black51,
    //                                                           fontWeight: FontWeight.w400,
    //                                                         ),
    //                                                         textAlignVertical: TextAlignVertical.center,
    //                                                         decoration: InputDecoration(
    //                                                           hintText: "Shawarmac".tr,
    //                                                           hintStyle: GoogleFonts.tajawal(
    //                                                             fontSize: 16.spt(context),
    //                                                             fontWeight: FontWeight.w400,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             color: ColorUtils.gray136,
    //                                                           ),
    //                                                           filled: true,
    //                                                           fillColor: ColorUtils.white255,
    //                                                           contentPadding: EdgeInsets.symmetric(
    //                                                             horizontal: 12.hpmt(context),
    //                                                             vertical: 12.vpmt(context),
    //                                                           ),
    //                                                           constraints: BoxConstraints(
    //                                                             maxHeight: 48.ht(context),
    //                                                           ),
    //                                                           border: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           enabledBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           focusedBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                                           ),
    //
    //                                                         ),
    //                                                       ),
    //
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                                                       Container(
    //                                                         width: 468.wt(context),
    //                                                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                                         child: Text(
    //                                                           "Phone Number *".tr,
    //                                                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                                           style: GoogleFonts.tajawal(
    //                                                             fontWeight: FontWeight.w700,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             fontSize: 16.spt(context),
    //                                                             color: ColorUtils.black33,
    //                                                           ),
    //                                                         ),
    //                                                       ),
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                                                       TextFormField(
    //                                                         controller: phoneNumberController.value,
    //                                                         textAlign: TextAlign.start,
    //                                                         cursorColor: ColorUtils.blue192,
    //                                                         cursorHeight: 20.ht(context),
    //                                                         style: GoogleFonts.tajawal(
    //                                                           fontSize: 16.spt(context),
    //                                                           fontStyle: FontStyle.normal,
    //                                                           color: ColorUtils.black51,
    //                                                           fontWeight: FontWeight.w400,
    //                                                         ),
    //                                                         textAlignVertical: TextAlignVertical.center,
    //                                                         decoration: InputDecoration(
    //                                                           hintText: "+968 91234567".tr,
    //                                                           hintStyle: GoogleFonts.tajawal(
    //                                                             fontSize: 16.spt(context),
    //                                                             fontWeight: FontWeight.w400,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             color: ColorUtils.gray136,
    //                                                           ),
    //                                                           filled: true,
    //                                                           fillColor: ColorUtils.white255,
    //                                                           contentPadding: EdgeInsets.symmetric(
    //                                                             horizontal: 12.hpmt(context),
    //                                                             vertical: 12.vpmt(context),
    //                                                           ),
    //                                                           constraints: BoxConstraints(
    //                                                             maxHeight: 48.ht(context),
    //                                                           ),
    //                                                           border: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           enabledBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           focusedBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                                           ),
    //
    //                                                         ),
    //                                                       ),
    //
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                                                       Container(
    //                                                         width: 468.wt(context),
    //                                                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                                         child: Text(
    //                                                           "Email Address *".tr,
    //                                                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                                           style: GoogleFonts.tajawal(
    //                                                             fontWeight: FontWeight.w700,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             fontSize: 16.spt(context),
    //                                                             color: ColorUtils.black33,
    //                                                           ),
    //                                                         ),
    //                                                       ),
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                                                       TextFormField(
    //                                                         controller: emailAddressController.value,
    //                                                         textAlign: TextAlign.start,
    //                                                         cursorColor: ColorUtils.blue192,
    //                                                         cursorHeight: 20.ht(context),
    //                                                         style: GoogleFonts.tajawal(
    //                                                           fontSize: 16.spt(context),
    //                                                           fontStyle: FontStyle.normal,
    //                                                           color: ColorUtils.black51,
    //                                                           fontWeight: FontWeight.w400,
    //                                                         ),
    //                                                         textAlignVertical: TextAlignVertical.center,
    //                                                         decoration: InputDecoration(
    //                                                           hintText: "shawarmac@gmail.com".tr,
    //                                                           hintStyle: GoogleFonts.tajawal(
    //                                                             fontSize: 16.spt(context),
    //                                                             fontWeight: FontWeight.w400,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             color: ColorUtils.gray136,
    //                                                           ),
    //                                                           filled: true,
    //                                                           fillColor: ColorUtils.white255,
    //                                                           contentPadding: EdgeInsets.symmetric(
    //                                                             horizontal: 12.hpmt(context),
    //                                                             vertical: 12.vpmt(context),
    //                                                           ),
    //                                                           constraints: BoxConstraints(
    //                                                             maxHeight: 48.ht(context),
    //                                                           ),
    //                                                           border: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           enabledBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           focusedBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                                           ),
    //
    //                                                         ),
    //                                                       ),
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                                                       Container(
    //                                                         width: 468.wt(context),
    //                                                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                                         child: Text(
    //                                                           "Bank account *".tr,
    //                                                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                                           style: GoogleFonts.tajawal(
    //                                                             fontWeight: FontWeight.w700,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             fontSize: 16.spt(context),
    //                                                             color: ColorUtils.black33,
    //                                                           ),
    //                                                         ),
    //                                                       ),
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                                                       TextFormField(
    //                                                         controller: bankAccountController.value,
    //                                                         textAlign: TextAlign.start,
    //                                                         cursorColor: ColorUtils.blue192,
    //                                                         cursorHeight: 20.ht(context),
    //                                                         style: GoogleFonts.tajawal(
    //                                                           fontSize: 16.spt(context),
    //                                                           fontStyle: FontStyle.normal,
    //                                                           color: ColorUtils.black51,
    //                                                           fontWeight: FontWeight.w400,
    //                                                         ),
    //                                                         textAlignVertical: TextAlignVertical.center,
    //                                                         decoration: InputDecoration(
    //                                                           hintText: "0334 7878 0988 0032".tr,
    //                                                           hintStyle: GoogleFonts.tajawal(
    //                                                             fontSize: 16.spt(context),
    //                                                             fontWeight: FontWeight.w400,
    //                                                             fontStyle: FontStyle.normal,
    //                                                             color: ColorUtils.gray136,
    //                                                           ),
    //                                                           filled: true,
    //                                                           fillColor: ColorUtils.white255,
    //                                                           contentPadding: EdgeInsets.symmetric(
    //                                                             horizontal: 12.hpmt(context),
    //                                                             vertical: 12.vpmt(context),
    //                                                           ),
    //                                                           constraints: BoxConstraints(
    //                                                             maxHeight: 48.ht(context),
    //                                                           ),
    //                                                           border: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           enabledBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                                           ),
    //                                                           focusedBorder: OutlineInputBorder(
    //                                                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                                           ),
    //
    //                                                         ),
    //                                                       ),
    //
    //
    //                                                       SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),
    //
    //                                                     ],
    //                                                   ),
    //                                                 )
    //
    //
    //                                               ],
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ));
    //                                     },
    //                                   );
    //                                 },
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.editIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //
    //
    //
    //                           ],
    //                         ),
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 14.ht(context)),
    //
    //                         Container(
    //                           width: 468.wt(context),
    //                           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                           child: Text(
    //                             "Restaurant Name".tr,
    //                             textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                             style: GoogleFonts.tajawal(
    //                               fontWeight: FontWeight.w700,
    //                               fontStyle: FontStyle.normal,
    //                               fontSize: 16.spt(context),
    //                               color: ColorUtils.black33,
    //                             ),
    //                           ),
    //                         ),
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                         TextFormField(
    //                           controller: restaurantNameController.value,
    //                           textAlign: TextAlign.start,
    //                           cursorColor: ColorUtils.blue192,
    //                           cursorHeight: 20.ht(context),
    //                           style: GoogleFonts.tajawal(
    //                             fontSize: 16.spt(context),
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.black51,
    //                             fontWeight: FontWeight.w400,
    //                           ),
    //                           textAlignVertical: TextAlignVertical.center,
    //                           decoration: InputDecoration(
    //                             hintText: "Shawarmac".tr,
    //                             hintStyle: GoogleFonts.tajawal(
    //                               fontSize: 16.spt(context),
    //                               fontWeight: FontWeight.w400,
    //                               fontStyle: FontStyle.normal,
    //                               color: ColorUtils.gray136,
    //                             ),
    //                             filled: true,
    //                             enabled: true,
    //                             fillColor: ColorUtils.white243,
    //                             contentPadding: EdgeInsets.symmetric(
    //                               horizontal: 12.hpmt(context),
    //                               vertical: 12.vpmt(context),
    //                             ),
    //                             constraints: BoxConstraints(
    //                               maxHeight: 48.ht(context),
    //                             ),
    //                             border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                             ),
    //
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                         Container(
    //                           width: 468.wt(context),
    //                           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                           child: Text(
    //                             "Email Address".tr,
    //                             textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                             style: GoogleFonts.tajawal(
    //                               fontWeight: FontWeight.w700,
    //                               fontStyle: FontStyle.normal,
    //                               fontSize: 16.spt(context),
    //                               color: ColorUtils.black33,
    //                             ),
    //                           ),
    //                         ),
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                         TextFormField(
    //                           controller: emailAddressController.value,
    //                           textAlign: TextAlign.start,
    //                           cursorColor: ColorUtils.blue192,
    //                           cursorHeight: 20.ht(context),
    //                           style: GoogleFonts.tajawal(
    //                             fontSize: 16.spt(context),
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.black51,
    //                             fontWeight: FontWeight.w400,
    //                           ),
    //                           textAlignVertical: TextAlignVertical.center,
    //                           decoration: InputDecoration(
    //                             hintText: "shawarmac@gmail.com".tr,
    //                             hintStyle: GoogleFonts.tajawal(
    //                               fontSize: 16.spt(context),
    //                               fontWeight: FontWeight.w400,
    //                               fontStyle: FontStyle.normal,
    //                               color: ColorUtils.gray136,
    //                             ),
    //                             filled: true,
    //                             enabled: true,
    //                             fillColor: ColorUtils.white243,
    //                             contentPadding: EdgeInsets.symmetric(
    //                               horizontal: 12.hpmt(context),
    //                               vertical: 12.vpmt(context),
    //                             ),
    //                             constraints: BoxConstraints(
    //                               maxHeight: 48.ht(context),
    //                             ),
    //                             border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                             ),
    //
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                         Container(
    //                           width: 468.wt(context),
    //                           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                           child: Text(
    //                             "Phone Number".tr,
    //                             textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                             style: GoogleFonts.tajawal(
    //                               fontWeight: FontWeight.w700,
    //                               fontStyle: FontStyle.normal,
    //                               fontSize: 16.spt(context),
    //                               color: ColorUtils.black33,
    //                             ),
    //                           ),
    //                         ),
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                         TextFormField(
    //                           controller: phoneNumberController.value,
    //                           textAlign: TextAlign.start,
    //                           cursorColor: ColorUtils.blue192,
    //                           cursorHeight: 20.ht(context),
    //                           style: GoogleFonts.tajawal(
    //                             fontSize: 16.spt(context),
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.black51,
    //                             fontWeight: FontWeight.w400,
    //                           ),
    //                           textAlignVertical: TextAlignVertical.center,
    //                           decoration: InputDecoration(
    //                             hintText: "+968 91234567".tr,
    //                             hintStyle: GoogleFonts.tajawal(
    //                               fontSize: 16.spt(context),
    //                               fontWeight: FontWeight.w400,
    //                               fontStyle: FontStyle.normal,
    //                               color: ColorUtils.gray136,
    //                             ),
    //                             filled: true,
    //                             enabled: true,
    //                             fillColor: ColorUtils.white243,
    //                             contentPadding: EdgeInsets.symmetric(
    //                               horizontal: 12.hpmt(context),
    //                               vertical: 12.vpmt(context),
    //                             ),
    //                             constraints: BoxConstraints(
    //                               maxHeight: 48.ht(context),
    //                             ),
    //                             border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                             ),
    //
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                         Container(
    //                           width: 468.wt(context),
    //                           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                           child: Text(
    //                             "Bank Account".tr,
    //                             textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                             style: GoogleFonts.tajawal(
    //                               fontWeight: FontWeight.w700,
    //                               fontStyle: FontStyle.normal,
    //                               fontSize: 16.spt(context),
    //                               color: ColorUtils.black33,
    //                             ),
    //                           ),
    //                         ),
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                         TextFormField(
    //                           controller: bankAccountController.value,
    //                           textAlign: TextAlign.start,
    //                           cursorColor: ColorUtils.blue192,
    //                           cursorHeight: 20.ht(context),
    //                           style: GoogleFonts.tajawal(
    //                             fontSize: 16.spt(context),
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.black51,
    //                             fontWeight: FontWeight.w400,
    //                           ),
    //                           textAlignVertical: TextAlignVertical.center,
    //                           decoration: InputDecoration(
    //                             hintText: "0334 7878 0988 0032".tr,
    //                             hintStyle: GoogleFonts.tajawal(
    //                               fontSize: 16.spt(context),
    //                               fontWeight: FontWeight.w400,
    //                               fontStyle: FontStyle.normal,
    //                               color: ColorUtils.gray136,
    //                             ),
    //                             filled: true,
    //                             enabled: true,
    //                             fillColor: ColorUtils.white243,
    //                             contentPadding: EdgeInsets.symmetric(
    //                               horizontal: 12.hpmt(context),
    //                               vertical: 12.vpmt(context),
    //                             ),
    //                             constraints: BoxConstraints(
    //                               maxHeight: 48.ht(context),
    //                             ),
    //                             border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                             ),
    //                             focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(8.rt(context)),
    //                               borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                             ),
    //
    //                           ),
    //                         ),
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 138.hpmt(context),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //
    //                       SizedBox(
    //                         height: 54.ht(context),
    //                         width: 744.wt(context),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             showAdaptiveDialog(
    //                               context: context,
    //                               barrierDismissible: true,
    //                               builder: (context) {
    //                                 return Obx(()=>Padding(
    //                                   padding: EdgeInsets.symmetric(
    //                                     vertical: 330.vpmt(context),
    //                                     horizontal: 158.hpmt(context),
    //                                   ),
    //                                   child: Container(
    //                                     width: 468.wt(context),
    //                                     height: 500.ht(context),
    //                                     decoration: BoxDecoration(
    //                                       color: ColorUtils.white255,
    //                                       borderRadius: BorderRadius.circular(16.rt(context)),
    //                                     ),
    //                                     padding: EdgeInsets.symmetric(
    //                                       vertical: 30.vpmt(context),
    //                                       horizontal: 20.hpmt(context),
    //                                     ),
    //                                     child: Material(
    //                                       color: Colors.transparent,
    //                                       child: Column(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Container(
    //                                             width: 468.wt(context),
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "Current Password".tr,
    //                                               textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w700,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 16.spt(context),
    //                                                 color: ColorUtils.black33,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //                                           TextFormField(
    //                                             controller: currentPasswordController.value,
    //                                             textAlign: TextAlign.start,
    //                                             cursorColor: ColorUtils.blue192,
    //                                             style: currentObscureText.value == true ?
    //                                             GoogleFonts.openSans(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ) :
    //                                             GoogleFonts.tajawal(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                             cursorHeight: 20.ht(context),
    //                                             obscureText: currentObscureText.value,
    //                                             textAlignVertical: TextAlignVertical.center,
    //                                             obscuringCharacter: "*",
    //                                             decoration: InputDecoration(
    //                                               alignLabelWithHint: true,
    //                                               hintText: "********",
    //                                               hintStyle: GoogleFonts.openSans(
    //                                                 fontSize: 16.spt(context),
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                               filled: true,
    //                                               suffixIcon: Container(
    //                                                 height: 24.ht(context),
    //                                                 width: 24.wt(context),
    //                                                 padding: EdgeInsets.symmetric(
    //                                                   horizontal: 12.hpmt(context),
    //                                                   vertical: 12.vpmt(context),
    //                                                 ),
    //                                                 decoration: BoxDecoration(
    //                                                   color: Colors.transparent,
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () {
    //                                                     if(currentObscureText.value == true) {
    //                                                       currentObscureText.value = false;
    //                                                     } else {
    //                                                       currentObscureText.value = true;
    //                                                     }
    //                                                   },
    //                                                   child: FittedBox(
    //                                                     fit: BoxFit.cover,
    //                                                     child: Image.asset(
    //                                                       currentObscureText.value == true ?
    //                                                       ImagePathUtils.visibilityOffFocusIconImagePath :
    //                                                       ImagePathUtils.visibilityFocusIconImagePath,
    //                                                       fit: BoxFit.cover,
    //                                                       alignment: Alignment.center,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               fillColor: ColorUtils.white255,
    //                                               contentPadding: EdgeInsets.symmetric(
    //                                                 horizontal: 12.hpmt(context),
    //                                                 vertical: 12.vpmt(context),
    //                                               ),
    //                                               constraints: BoxConstraints(
    //                                                 maxHeight: 48.ht(context),
    //                                               ),
    //                                               border:  OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               enabledBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               focusedBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                               ),
    //
    //                                             ),
    //                                           ),
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //
    //                                           Container(
    //                                             width: 468.wt(context),
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "New Password".tr,
    //                                               textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w700,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 16.spt(context),
    //                                                 color: ColorUtils.black33,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //                                           TextFormField(
    //                                             controller: passwordController.value,
    //                                             textAlign: TextAlign.start,
    //                                             cursorColor: ColorUtils.blue192,
    //                                             style: obscureText.value == true ?
    //                                             GoogleFonts.openSans(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ) :
    //                                             GoogleFonts.tajawal(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                             cursorHeight: 20.ht(context),
    //                                             obscureText: obscureText.value,
    //                                             textAlignVertical: TextAlignVertical.center,
    //                                             obscuringCharacter: "*",
    //                                             decoration: InputDecoration(
    //                                               alignLabelWithHint: true,
    //                                               hintText: "********",
    //                                               hintStyle: GoogleFonts.openSans(
    //                                                 fontSize: 16.spt(context),
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                               filled: true,
    //                                               suffixIcon: Container(
    //                                                 height: 24.ht(context),
    //                                                 width: 24.wt(context),
    //                                                 padding: EdgeInsets.symmetric(
    //                                                   horizontal: 12.hpmt(context),
    //                                                   vertical: 12.vpmt(context),
    //                                                 ),
    //                                                 decoration: BoxDecoration(
    //                                                     color: Colors.transparent
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () {
    //                                                     if(obscureText.value == true) {
    //                                                       obscureText.value = false;
    //                                                     } else {
    //                                                       obscureText.value = true;
    //                                                     }
    //                                                   },
    //                                                   child: FittedBox(
    //                                                     fit: BoxFit.cover,
    //                                                     child: Image.asset(
    //                                                       obscureText.value == true ?
    //                                                       ImagePathUtils.visibilityOffFocusIconImagePath :
    //                                                       ImagePathUtils.visibilityFocusIconImagePath,
    //                                                       fit: BoxFit.cover,
    //                                                       alignment: Alignment.center,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               fillColor: ColorUtils.white255,
    //                                               contentPadding: EdgeInsets.symmetric(
    //                                                 horizontal: 12.hpmt(context),
    //                                                 vertical: 12.vpmt(context),
    //                                               ),
    //                                               constraints: BoxConstraints(
    //                                                 maxHeight: 48.ht(context),
    //                                               ),
    //                                               border:  OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               enabledBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               focusedBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                               ),
    //
    //                                             ),
    //                                           ),
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                                           Container(
    //                                             width: 468.wt(context),
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "Confirm Password".tr,
    //                                               textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w700,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 16.spt(context),
    //                                                 color: ColorUtils.black33,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                                           TextFormField(
    //                                             controller: confirmPasswordController.value,
    //                                             textAlign: TextAlign.start,
    //                                             cursorColor: ColorUtils.blue192,
    //                                             style: confirmObscureText.value == true ?
    //                                             GoogleFonts.openSans(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ) :
    //                                             GoogleFonts.tajawal(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                             cursorHeight: 20.ht(context),
    //                                             obscureText: confirmObscureText.value,
    //                                             textAlignVertical: TextAlignVertical.center,
    //                                             obscuringCharacter: "*",
    //                                             decoration: InputDecoration(
    //                                               alignLabelWithHint: true,
    //                                               hintText: "********",
    //                                               hintStyle: GoogleFonts.openSans(
    //                                                 fontSize: 16.spt(context),
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                               filled: true,
    //                                               suffixIcon: Container(
    //                                                 height: 24.ht(context),
    //                                                 width: 24.wt(context),
    //                                                 padding: EdgeInsets.symmetric(
    //                                                   horizontal: 12.hpmt(context),
    //                                                   vertical: 12.vpmt(context),
    //                                                 ),
    //                                                 decoration: BoxDecoration(
    //                                                     color: Colors.transparent
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () {
    //                                                     if(confirmObscureText.value == true) {
    //                                                       confirmObscureText.value = false;
    //                                                     } else {
    //                                                       confirmObscureText.value = true;
    //                                                     }
    //                                                   },
    //                                                   child: FittedBox(
    //                                                     fit: BoxFit.cover,
    //                                                     child: Image.asset(
    //                                                       confirmObscureText.value == true ?
    //                                                       ImagePathUtils.visibilityOffFocusIconImagePath :
    //                                                       ImagePathUtils.visibilityFocusIconImagePath,
    //                                                       fit: BoxFit.cover,
    //                                                       alignment: Alignment.center,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               fillColor: ColorUtils.white255,
    //                                               contentPadding: EdgeInsets.symmetric(
    //                                                 horizontal: 12.hpmt(context),
    //                                                 vertical: 12.vpmt(context),
    //                                               ),
    //                                               constraints: BoxConstraints(
    //                                                 maxHeight: 48.ht(context),
    //                                               ),
    //                                               border:  OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               enabledBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               focusedBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                               ),
    //
    //                                             ),
    //                                           ),
    //
    //
    //
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),
    //
    //
    //                                           Row(
    //                                             mainAxisAlignment: MainAxisAlignment.center,
    //                                             children: [
    //
    //
    //                                               Container(
    //                                                 height: 52.ht(context),
    //                                                 width: 188.wt(context),
    //                                                 decoration: BoxDecoration(
    //                                                   color: ColorUtils.blue192,
    //                                                   borderRadius: BorderRadius.circular(8.rt(context),),
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () async {
    //                                                     Get.back();
    //                                                   },
    //                                                   child: Center(
    //                                                     child: Text(
    //                                                       "Save".tr,
    //                                                       textAlign: TextAlign.center,
    //                                                       style: GoogleFonts.tajawal(
    //                                                         fontWeight: FontWeight.w700,
    //                                                         fontStyle: FontStyle.normal,
    //                                                         fontSize: 18.spt(context),
    //                                                         color: ColorUtils.white255,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //
    //                                               SpacerWidget.spacerWidget(spaceWidth: 12.wt(context),),
    //
    //
    //                                               Container(
    //                                                 height: 48.ht(context),
    //                                                 width: 188.wt(context),
    //                                                 decoration: BoxDecoration(
    //                                                   border: Border.all(color: ColorUtils.gray136,width: 1),
    //                                                   color: ColorUtils.white255,
    //                                                   borderRadius: BorderRadius.circular(8.rm(context),),
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () async {
    //                                                     Get.back();
    //                                                   },
    //                                                   child: Center(
    //                                                     child: Text(
    //                                                       "Cancel".tr,
    //                                                       textAlign: TextAlign.center,
    //                                                       style: GoogleFonts.tajawal(
    //                                                         fontWeight: FontWeight.w700,
    //                                                         fontStyle: FontStyle.normal,
    //                                                         fontSize: 18.spt(context),
    //                                                         color: ColorUtils.black51,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //
    //
    //                                             ],
    //                                           )
    //
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ));
    //                               },
    //                             );
    //                           },
    //                           child: Container(
    //                             height: 54.ht(context),
    //                             width: 744.wt(context),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: Row(
    //                               children: [
    //
    //
    //                                 Expanded(
    //                                   child: Row(
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(ImagePathUtils.changePasswordIconImagePath),
    //                                         ),
    //                                       ),
    //
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                       Container(
    //                                         alignment: Alignment.centerLeft,
    //                                         child: Text(
    //                                           "Change Password".tr,
    //                                           textAlign: TextAlign.center,
    //                                           style: GoogleFonts.tajawal(
    //                                             fontWeight: FontWeight.w700,
    //                                             fontStyle: FontStyle.normal,
    //                                             fontSize: 20.spt(context),
    //                                             color: ColorUtils.black33,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                     ],
    //                                   ),
    //                                 ),
    //
    //
    //                                 SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                 Container(
    //                                   height: 24.ht(context),
    //                                   width: 24.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.transparent,
    //                                   ),
    //                                   child: FittedBox(
    //                                     fit: BoxFit.contain,
    //                                     child: Image.asset(
    //                                       Get.locale.toString() == "en" ?
    //                                       ImagePathUtils.arrowFilledIconImagePath :
    //                                       ImagePathUtils.arrowFilledBackIconImagePath,
    //                                       fit: BoxFit.cover,
    //                                       alignment: Alignment.center,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                       SizedBox(
    //                         height: 54.ht(context),
    //                         width: 744.wt(context),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             showAdaptiveDialog(
    //                               context: context,
    //                               barrierDismissible: true,
    //                               builder: (context) {
    //                                 return Obx(()=>Padding(
    //                                   padding: EdgeInsets.symmetric(
    //                                     vertical: 410.vpmt(context),
    //                                     horizontal: 158.hpmt(context),
    //                                   ),
    //                                   child: Container(
    //                                     width: 468.wt(context),
    //                                     height: 300.ht(context),
    //                                     decoration: BoxDecoration(
    //                                       color: ColorUtils.white255,
    //                                       borderRadius: BorderRadius.circular(16.rt(context)),
    //                                     ),
    //                                     padding: EdgeInsets.symmetric(
    //                                       vertical: 30.vpmt(context),
    //                                       horizontal: 20.hpmt(context),
    //                                     ),
    //                                     child: Material(
    //                                       color: Colors.transparent,
    //                                       child: Column(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //
    //                                           Container(
    //                                             height: 56.ht(context),
    //                                             width: 468.wt(context),
    //                                             decoration: BoxDecoration(
    //                                               border: isArabic.value == false  ?
    //                                               Border.all(color: ColorUtils.white217,width: 1) :
    //                                               Border.all(color: ColorUtils.blue192,width: 1),
    //                                               borderRadius: BorderRadius.circular(10.rt(context)),
    //                                             ),
    //                                             padding: EdgeInsets.symmetric(vertical: 12.vpmt(context),horizontal: 12.hpmt(context)),
    //                                             child: TextButton(
    //                                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                               onPressed: () async {
    //                                                 if(isArabic.value == true) {
    //                                                   isArabic.value = false;
    //                                                   isEnglish.value = false;
    //                                                 } else {
    //                                                   isArabic.value = true;
    //                                                   isEnglish.value = false;
    //                                                 }
    //                                               },
    //                                               child: Row(
    //                                                 children: [
    //
    //
    //                                                   Container(
    //                                                     height: 30.ht(context),
    //                                                     width: 30.wt(context),
    //                                                     decoration: BoxDecoration(
    //                                                       border: isArabic.value  == false  ?
    //                                                       Border.all(color: ColorUtils.white217,width: 1) :
    //                                                       Border.all(color: ColorUtils.blue192,width: 1),
    //                                                       shape: BoxShape.circle,
    //                                                     ),
    //                                                     child: Center(
    //                                                       child: Container(
    //                                                         height: 16.ht(context),
    //                                                         width: 16.wt(context),
    //                                                         decoration: BoxDecoration(
    //                                                             shape: BoxShape.circle,
    //                                                             color: isArabic.value == false ?
    //                                                             Colors.transparent : ColorUtils.blue192
    //                                                         ),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //
    //                                                   SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
    //
    //                                                   Expanded(
    //                                                     child: Container(
    //                                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                                       child: Text(
    //                                                         "Arabic".tr,
    //                                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                                         style: GoogleFonts.tajawal(
    //                                                           fontWeight: FontWeight.w700,
    //                                                           fontStyle: FontStyle.normal,
    //                                                           fontSize: 18.spt(context),
    //                                                           color: ColorUtils.black30,
    //                                                         ),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),
    //
    //
    //                                           Container(
    //                                             height: 56.ht(context),
    //                                             width: 468.wt(context),
    //                                             decoration: BoxDecoration(
    //                                               border: isEnglish.value == false  ?
    //                                               Border.all(color: ColorUtils.white217,width: 1) :
    //                                               Border.all(color: ColorUtils.blue192,width: 1),
    //                                               borderRadius: BorderRadius.circular(10.rt(context)),
    //                                             ),
    //                                             padding: EdgeInsets.symmetric(vertical: 12.vpmt(context),horizontal: 12.hpmt(context)),
    //                                             child: TextButton(
    //                                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                               onPressed: () async {
    //                                                 if(isEnglish.value == true) {
    //                                                   isArabic.value = false;
    //                                                   isEnglish.value = false;
    //                                                 } else {
    //                                                   isArabic.value = false;
    //                                                   isEnglish.value = true;
    //                                                 }
    //                                               },
    //                                               child: Row(
    //                                                 children: [
    //
    //
    //                                                   Container(
    //                                                     height: 30.ht(context),
    //                                                     width: 30.wt(context),
    //                                                     decoration: BoxDecoration(
    //                                                       border: isEnglish.value == false  ?
    //                                                       Border.all(color: ColorUtils.white217,width: 1) :
    //                                                       Border.all(color: ColorUtils.blue192,width: 1),
    //                                                       shape: BoxShape.circle,
    //                                                     ),
    //                                                     child: Center(
    //                                                       child: Container(
    //                                                         height: 16.ht(context),
    //                                                         width: 16.wt(context),
    //                                                         decoration: BoxDecoration(
    //                                                             shape: BoxShape.circle,
    //                                                             color: isEnglish.value == false ?
    //                                                             Colors.transparent : ColorUtils.blue192
    //                                                         ),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //
    //                                                   SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
    //
    //                                                   Expanded(
    //                                                     child: Container(
    //                                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                                       child: Text(
    //                                                         "English".tr,
    //                                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                                         style: GoogleFonts.tajawal(
    //                                                           fontWeight: FontWeight.w700,
    //                                                           fontStyle: FontStyle.normal,
    //                                                           fontSize: 18.spt(context),
    //                                                           color: ColorUtils.black30,
    //                                                         ),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),
    //
    //
    //                                           Row(
    //                                             mainAxisAlignment: MainAxisAlignment.center,
    //                                             children: [
    //
    //
    //                                               Container(
    //                                                 height: 52.ht(context),
    //                                                 width: 188.wt(context),
    //                                                 decoration: BoxDecoration(
    //                                                   color: ColorUtils.blue192,
    //                                                   borderRadius: BorderRadius.circular(8.rt(context),),
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () async {
    //                                                     if(isEnglish.value == true) {
    //                                                       Get.updateLocale(Locale("en"));
    //                                                     } else {
    //                                                       Get.updateLocale(Locale("ar"));
    //                                                     }
    //                                                     Get.back();
    //                                                   },
    //                                                   child: Center(
    //                                                     child: Text(
    //                                                       "Save".tr,
    //                                                       textAlign: TextAlign.center,
    //                                                       style: GoogleFonts.tajawal(
    //                                                         fontWeight: FontWeight.w700,
    //                                                         fontStyle: FontStyle.normal,
    //                                                         fontSize: 18.spt(context),
    //                                                         color: ColorUtils.white255,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //
    //                                               SpacerWidget.spacerWidget(spaceWidth: 12.wt(context),),
    //
    //
    //                                               Container(
    //                                                 height: 52.ht(context),
    //                                                 width: 188.wt(context),
    //                                                 decoration: BoxDecoration(
    //                                                   border: Border.all(color: ColorUtils.gray136,width: 1),
    //                                                   color: ColorUtils.white255,
    //                                                   borderRadius: BorderRadius.circular(8.rt(context),),
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () async {
    //                                                     Get.back();
    //                                                   },
    //                                                   child: Center(
    //                                                     child: Text(
    //                                                       "Cancel".tr,
    //                                                       textAlign: TextAlign.center,
    //                                                       style: GoogleFonts.tajawal(
    //                                                         fontWeight: FontWeight.w700,
    //                                                         fontStyle: FontStyle.normal,
    //                                                         fontSize: 18.spt(context),
    //                                                         color: ColorUtils.black51,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //
    //
    //                                             ],
    //                                           )
    //
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ));
    //                               },
    //                             );
    //                           },
    //                           child: Container(
    //                             height: 54.ht(context),
    //                             width: 744.wt(context),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: Row(
    //                               children: [
    //
    //
    //                                 Expanded(
    //                                   child: Row(
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(ImagePathUtils.languageChangeIconImagePath),
    //                                         ),
    //                                       ),
    //
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                       Container(
    //                                         alignment: Alignment.centerLeft,
    //                                         child: Text(
    //                                           "Change App Language".tr,
    //                                           textAlign: TextAlign.center,
    //                                           style: GoogleFonts.tajawal(
    //                                             fontWeight: FontWeight.w700,
    //                                             fontStyle: FontStyle.normal,
    //                                             fontSize: 20.spt(context),
    //                                             color: ColorUtils.black33,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                     ],
    //                                   ),
    //                                 ),
    //
    //
    //                                 SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                 Container(
    //                                   height: 24.ht(context),
    //                                   width: 24.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.transparent,
    //                                   ),
    //                                   child: FittedBox(
    //                                     fit: BoxFit.contain,
    //                                     child: Image.asset(
    //                                       Get.locale.toString() == "en" ?
    //                                       ImagePathUtils.arrowFilledIconImagePath :
    //                                       ImagePathUtils.arrowFilledBackIconImagePath,
    //                                       fit: BoxFit.cover,
    //                                       alignment: Alignment.center,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //
    //                       SizedBox(
    //                         height: 54.ht(context),
    //                         width: 744.wt(context),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             Get.off(()=> TermsAndConditionsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                           },
    //                           child: Container(
    //                             height: 54.ht(context),
    //                             width: 744.wt(context),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: Row(
    //                               children: [
    //
    //
    //                                 Expanded(
    //                                   child: Row(
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(ImagePathUtils.termsAndConditionIconImagePath),
    //                                         ),
    //                                       ),
    //
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                       Container(
    //                                         alignment: Alignment.centerLeft,
    //                                         child: Text(
    //                                           "Terms and Conditions".tr,
    //                                           textAlign: TextAlign.center,
    //                                           style: GoogleFonts.tajawal(
    //                                             fontWeight: FontWeight.w700,
    //                                             fontStyle: FontStyle.normal,
    //                                             fontSize: 20.spt(context),
    //                                             color: ColorUtils.black33,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                     ],
    //                                   ),
    //                                 ),
    //
    //
    //                                 SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                 Container(
    //                                   height: 24.ht(context),
    //                                   width: 24.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.transparent,
    //                                   ),
    //                                   child: FittedBox(
    //                                     fit: BoxFit.contain,
    //                                     child: Image.asset(
    //                                       Get.locale.toString() == "en" ?
    //                                       ImagePathUtils.arrowFilledIconImagePath :
    //                                       ImagePathUtils.arrowFilledBackIconImagePath,
    //                                       fit: BoxFit.cover,
    //                                       alignment: Alignment.center,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
    //
    //                       SizedBox(
    //                         height: 54.ht(context),
    //                         width: 744.wt(context),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             Get.off(()=> HelpCenterScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                           },
    //                           child: Container(
    //                             height: 54.ht(context),
    //                             width: 744.wt(context),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: Row(
    //                               children: [
    //
    //
    //                                 Expanded(
    //                                   child: Row(
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(ImagePathUtils.helpCenterIconImagePath),
    //                                         ),
    //                                       ),
    //
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                       Container(
    //                                         alignment: Alignment.centerLeft,
    //                                         child: Text(
    //                                           "Help Center".tr,
    //                                           textAlign: TextAlign.center,
    //                                           style: GoogleFonts.tajawal(
    //                                             fontWeight: FontWeight.w700,
    //                                             fontStyle: FontStyle.normal,
    //                                             fontSize: 20.spt(context),
    //                                             color: ColorUtils.black33,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                     ],
    //                                   ),
    //                                 ),
    //
    //
    //                                 SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                 Container(
    //                                   height: 24.ht(context),
    //                                   width: 24.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.transparent,
    //                                   ),
    //                                   child: FittedBox(
    //                                     fit: BoxFit.contain,
    //                                     child: Image.asset(
    //                                       Get.locale.toString() == "en" ?
    //                                       ImagePathUtils.arrowFilledIconImagePath :
    //                                       ImagePathUtils.arrowFilledBackIconImagePath,
    //                                       fit: BoxFit.cover,
    //                                       alignment: Alignment.center,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //
    //                     ],
    //                   ),
    //                 ),
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
    //
    //
    //                 Container(
    //                   height: 48.ht(context),
    //                   width: 300.wt(context),
    //                   decoration: BoxDecoration(
    //                     color: ColorUtils.red211,
    //                     borderRadius: BorderRadius.circular(8.rt(context)),
    //                   ),
    //                   child: TextButton(
    //                     style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                     onPressed: () async {
    //                       Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                     },
    //                     child: Center(
    //                       child: Text(
    //                         "Sign out".tr,
    //                         textAlign: TextAlign.center,
    //                         style: GoogleFonts.tajawal(
    //                           fontWeight: FontWeight.w700,
    //                           fontStyle: FontStyle.normal,
    //                           fontSize: 18.spt(context),
    //                           color: ColorUtils.white255,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
    //
    //
    //               ],
    //             ),
    //           ),
    //
    //
    //
    //         ],
    //       ),
    //     ),
    //   ));
    // } else {
    //
    // }
    return Obx(()=>SafeArea(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.hpmm(context),
                    ),
                    child: Container(
                      width: 390.wm(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.white217,width: .5),
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
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [

                                  SizedBox(
                                    height: 100.hm(context),
                                    width: 100.wm(context),
                                  ),


                                  imageFile.value.path == "" ?
                                  Container(
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
                                            offset: Offset(0, 0)
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 59.hm(context),
                                      width: 59.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.noImageIconImagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ) :
                                  Container(
                                    height: 100.hm(context),
                                    width: 100.wm(context),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white252,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: FileImage(imageFile.value,),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorUtils.black025,
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 0)
                                        )
                                      ],
                                    ),
                                  ),


                                  Positioned(
                                    child: Container(
                                      height: 100.hm(context),
                                      width: 100.wm(context),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent
                                      ),
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
                                                              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                              if (pickedFile != null) {
                                                                print('Image selected: ${pickedFile.path}');
                                                                imageFile.value = File(pickedFile.path);
                                                              } else {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  SnackBar(
                                                                    content: Text('No image selected'),
                                                                    duration: Duration(seconds: 2),
                                                                  ),
                                                                );
                                                              }
                                                              Get.back();
                                                            },
                                                          ),
                                                          ListTile(
                                                            leading: Icon(Icons.camera_alt),
                                                            title: Text('Camera'),
                                                            onTap: () async {
                                                              final pickedFile = await ImagePicker().pickImage(
                                                                  source: ImageSource.camera);
                                                              if (pickedFile != null) {
                                                                imageFile.value = File(pickedFile.path);
                                                                print('Image selected: ${pickedFile.path}');
                                                              } else {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  SnackBar(
                                                                    content: Text('No image selected'),
                                                                    duration: Duration(seconds: 2),
                                                                  ),
                                                                );
                                                              }
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
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
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
                                  )


                                ],
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Mohammed Ali".tr,
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
                              "1234565".tr,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.hpmm(context),
                    ),
                    child: Container(
                      width: 390.wm(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.white217,width: .5),
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
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    showAdaptiveDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return Obx(()=>Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 140.vpmm(context),
                                            horizontal: 16.hpmm(context),
                                          ),
                                          child: Container(
                                            width: 358.wm(context),
                                            height: 500.hm(context),
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
                                                    width: 358.wm(context),
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                    child: Text(
                                                      "Restaurant Name *".tr,
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
                                                    controller: restaurantNameController.value,
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
                                                      hintText: "Shawaremac".tr,
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
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                                      ),

                                                    ),
                                                  ),


                                                  SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                                                  Container(
                                                    width: 358.wm(context),
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                    child: Text(
                                                      "Phone Number *".tr,
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
                                                    controller: phoneNumberController.value,
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
                                                      hintText: "+968 91234567".tr,
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
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                                      ),

                                                    ),
                                                  ),


                                                  SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                                                  Container(
                                                    width: 358.wm(context),
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                    child: Text(
                                                      "Email Address *".tr,
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
                                                    controller: emailAddressController.value,
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
                                                      hintText: "shawaremak@gmail.com".tr,
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
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                                      ),

                                                    ),
                                                  ),

                                                  SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                                                  Container(
                                                    width: 358.wm(context),
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                    child: Text(
                                                      "Bank account *".tr,
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
                                                    controller: bankAccountController.value,
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
                                                      hintText: "0334 7878 0988 0032".tr,
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
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                                        borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                                      ),

                                                    ),
                                                  ),


                                                  SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [


                                                      Container(
                                                        height: 48.hm(context),
                                                        width: 153.wm(context),
                                                        decoration: BoxDecoration(
                                                          color: ColorUtils.blue192,
                                                          borderRadius: BorderRadius.circular(8.rm(context),),
                                                        ),
                                                        child: TextButton(
                                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                          onPressed: () async {
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

                                                      SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                                                      Container(
                                                        height: 48.hm(context),
                                                        width: 153.wm(context),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: ColorUtils.gray136,width: 1),
                                                          color: ColorUtils.white255,
                                                          borderRadius: BorderRadius.circular(8.rm(context),),
                                                        ),
                                                        child: TextButton(
                                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                          onPressed: () async {
                                                            Get.back();
                                                          },
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
                                                  )

                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                                      },
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

                          Container(
                            width: 358.wm(context),
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Restaurant Name".tr,
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
                            controller: restaurantNameController.value,
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
                              hintText: "Shawarmac".tr,
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.spm(context),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: ColorUtils.gray136,
                              ),
                              filled: true,
                              enabled: true,
                              fillColor: ColorUtils.white243,
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
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                              ),

                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                          Container(
                            width: 358.wm(context),
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Email Address".tr,
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
                            controller: emailAddressController.value,
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
                              hintText: "shawarmac@gmail.com".tr,
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.spm(context),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: ColorUtils.gray136,
                              ),
                              filled: true,
                              enabled: true,
                              fillColor: ColorUtils.white243,
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
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                              ),

                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                          Container(
                            width: 358.wm(context),
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Phone Number".tr,
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
                            controller: phoneNumberController.value,
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
                              hintText: "+968 91234567".tr,
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.spm(context),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: ColorUtils.gray136,
                              ),
                              filled: true,
                              enabled: true,
                              fillColor: ColorUtils.white243,
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
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                              ),

                            ),
                          ),

                          SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                          Container(
                            width: 358.wm(context),
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Bank account".tr,
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
                            controller: bankAccountController.value,
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
                              hintText: "0334 7878 0988 0032".tr,
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.spm(context),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: ColorUtils.gray136,
                              ),
                              filled: true,
                              enabled: true,
                              fillColor: ColorUtils.white243,
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
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rm(context)),
                                borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                              ),

                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


                        ],
                      ),
                    ),
                  ),


                  SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.hpmm(context),
                    ),
                    child: Column(
                      children: [

                        SizedBox(
                          height: 54.hm(context),
                          width: 390.wm(context),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              showAdaptiveDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Obx(()=>Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 180.vpmm(context),
                                      horizontal: 16.hpmm(context),
                                    ),
                                    child: Container(
                                      width: 358.wm(context),
                                      height: 435.hm(context),
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
                                              width: 358.wm(context),
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "Current Password".tr,
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
                                              controller: currentPasswordController.value,
                                              textAlign: TextAlign.start,
                                              cursorColor: ColorUtils.blue192,
                                              style: currentObscureText.value == true ?
                                              GoogleFonts.openSans(
                                                fontSize: 16.spm(context),
                                                fontStyle: FontStyle.normal,
                                                color: ColorUtils.black51,
                                                fontWeight: FontWeight.w400,
                                              ) :
                                              GoogleFonts.tajawal(
                                                fontSize: 16.spm(context),
                                                fontStyle: FontStyle.normal,
                                                color: ColorUtils.black51,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              cursorHeight: 20.hm(context),
                                              obscureText: currentObscureText.value,
                                              textAlignVertical: TextAlignVertical.center,
                                              obscuringCharacter: "*",
                                              decoration: InputDecoration(
                                                alignLabelWithHint: true,
                                                hintText: "********",
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
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent
                                                  ),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                    onPressed: () {
                                                      if(currentObscureText.value == true) {
                                                        currentObscureText.value = false;
                                                      } else {
                                                        currentObscureText.value = true;
                                                      }
                                                    },
                                                    child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Image.asset(
                                                        currentObscureText.value == true ?
                                                        ImagePathUtils.visibilityOffFocusIconImagePath :
                                                        ImagePathUtils.visibilityFocusIconImagePath,
                                                        fit: BoxFit.cover,
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
                                                  maxWidth: 358.wm(context),
                                                  maxHeight: 48.hm(context),
                                                ),
                                                border:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                                ),

                                              ),
                                            ),


                                            SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),



                                            Container(
                                              width: 358.wm(context),
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "New Password".tr,
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
                                              controller: passwordController.value,
                                              textAlign: TextAlign.start,
                                              cursorColor: ColorUtils.blue192,
                                              style: obscureText.value == true ?
                                              GoogleFonts.openSans(
                                                fontSize: 16.spm(context),
                                                fontStyle: FontStyle.normal,
                                                color: ColorUtils.black51,
                                                fontWeight: FontWeight.w400,
                                              ) :
                                              GoogleFonts.tajawal(
                                                fontSize: 16.spm(context),
                                                fontStyle: FontStyle.normal,
                                                color: ColorUtils.black51,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              cursorHeight: 20.hm(context),
                                              obscureText: obscureText.value,
                                              textAlignVertical: TextAlignVertical.center,
                                              obscuringCharacter: "*",
                                              decoration: InputDecoration(
                                                alignLabelWithHint: true,
                                                hintText: "********",
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
                                                      fit: BoxFit.cover,
                                                      child: Image.asset(
                                                        obscureText.value == true ?
                                                        ImagePathUtils.visibilityOffFocusIconImagePath :
                                                        ImagePathUtils.visibilityFocusIconImagePath,
                                                        fit: BoxFit.cover,
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
                                                  maxWidth: 358.wm(context),
                                                  maxHeight: 48.hm(context),
                                                ),
                                                border:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                                ),

                                              ),
                                            ),


                                            SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                                            Container(
                                              width: 358.wm(context),
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "Confirm Password".tr,
                                                textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                              controller: confirmPasswordController.value,
                                              textAlign: TextAlign.start,
                                              cursorColor: ColorUtils.blue192,
                                              style: confirmObscureText.value == true ?
                                              GoogleFonts.openSans(
                                                fontSize: 16.spm(context),
                                                fontStyle: FontStyle.normal,
                                                color: ColorUtils.black51,
                                                fontWeight: FontWeight.w400,
                                              ) :
                                              GoogleFonts.tajawal(
                                                fontSize: 16.spm(context),
                                                fontStyle: FontStyle.normal,
                                                color: ColorUtils.black51,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              cursorHeight: 20.hm(context),
                                              obscureText: confirmObscureText.value,
                                              textAlignVertical: TextAlignVertical.center,
                                              obscuringCharacter: "*",
                                              decoration: InputDecoration(
                                                alignLabelWithHint: true,
                                                hintText: "********",
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
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent
                                                  ),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                    onPressed: () {
                                                      if(confirmObscureText.value == true) {
                                                        confirmObscureText.value = false;
                                                      } else {
                                                        confirmObscureText.value = true;
                                                      }
                                                    },
                                                    child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Image.asset(
                                                        confirmObscureText.value == true ?
                                                        ImagePathUtils.visibilityOffFocusIconImagePath :
                                                        ImagePathUtils.visibilityFocusIconImagePath,
                                                        fit: BoxFit.cover,
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
                                                  maxWidth: 358.wm(context),
                                                  maxHeight: 48.hm(context),
                                                ),
                                                border:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                  borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                                ),

                                              ),
                                            ),





                                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [


                                                Container(
                                                  height: 48.hm(context),
                                                  width: 153.wm(context),
                                                  decoration: BoxDecoration(
                                                    color: ColorUtils.blue192,
                                                    borderRadius: BorderRadius.circular(8.rm(context),),
                                                  ),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                    onPressed: () async {
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

                                                SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                                                Container(
                                                  height: 48.hm(context),
                                                  width: 153.wm(context),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: ColorUtils.gray136,width: 1),
                                                    color: ColorUtils.white255,
                                                    borderRadius: BorderRadius.circular(8.rm(context),),
                                                  ),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                    onPressed: () async {
                                                      Get.back();
                                                    },
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
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                                },
                              );
                            },
                            child: Container(
                              height: 54.hm(context),
                              width: 390.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Row(
                                children: [


                                  Expanded(
                                    child: Row(
                                      children: [


                                        Container(
                                          height: 24.hm(context),
                                          width: 24.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(ImagePathUtils.changePasswordIconImagePath),
                                          ),
                                        ),


                                        SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Change Password".tr,
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
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.asset(
                                        Get.locale.toString() == "en" ?
                                        ImagePathUtils.arrowFilledIconImagePath :
                                        ImagePathUtils.arrowFilledBackIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                        SizedBox(
                          height: 54.hm(context),
                          width: 390.wm(context),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              showAdaptiveDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Obx(()=>Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 265.vpmm(context),
                                      horizontal: 16.hpmm(context),
                                    ),
                                    child: Container(
                                      width: 358.wm(context),
                                      height: 290.hm(context),
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
                                              height: 56.hm(context),
                                              width: 358.wm(context),
                                              decoration: BoxDecoration(
                                                border: isArabic.value == false  ?
                                                Border.all(color: ColorUtils.white217,width: 1) :
                                                Border.all(color: ColorUtils.blue192,width: 1),
                                                borderRadius: BorderRadius.circular(10.rm(context)),
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 12.vpmm(context),horizontal: 12.hpmm(context)),
                                              child: TextButton(
                                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                onPressed: () async {
                                                  if(isArabic.value == true) {
                                                    isArabic.value = false;
                                                    isEnglish.value = false;
                                                  } else {
                                                    isArabic.value = true;
                                                    isEnglish.value = false;
                                                  }
                                                },
                                                child: Row(
                                                  children: [


                                                    Container(
                                                      height: 30.hm(context),
                                                      width: 30.wm(context),
                                                      decoration: BoxDecoration(
                                                        border: isArabic.value  == false  ?
                                                        Border.all(color: ColorUtils.white217,width: 1) :
                                                        Border.all(color: ColorUtils.blue192,width: 1),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          height: 16.hm(context),
                                                          width: 16.wm(context),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: isArabic.value == false ?
                                                              Colors.transparent : ColorUtils.blue192
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),

                                                    Expanded(
                                                      child: Container(
                                                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                        child: Text(
                                                          "Arabic".tr,
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
                                                border: isEnglish.value == false  ?
                                                Border.all(color: ColorUtils.white217,width: 1) :
                                                Border.all(color: ColorUtils.blue192,width: 1),
                                                borderRadius: BorderRadius.circular(10.rm(context)),
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 12.vpmm(context),horizontal: 12.hpmm(context)),
                                              child: TextButton(
                                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                onPressed: () async {
                                                  if(isEnglish.value == true) {
                                                    isArabic.value = false;
                                                    isEnglish.value = false;
                                                  } else {
                                                    isArabic.value = false;
                                                    isEnglish.value = true;
                                                  }
                                                },
                                                child: Row(
                                                  children: [


                                                    Container(
                                                      height: 30.hm(context),
                                                      width: 30.wm(context),
                                                      decoration: BoxDecoration(
                                                        border: isEnglish.value == false  ?
                                                        Border.all(color: ColorUtils.white217,width: 1) :
                                                        Border.all(color: ColorUtils.blue192,width: 1),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          height: 16.hm(context),
                                                          width: 16.wm(context),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: isEnglish.value == false ?
                                                              Colors.transparent : ColorUtils.blue192
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),

                                                    Expanded(
                                                      child: Container(
                                                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                        child: Text(
                                                          "English".tr,
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


                                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [


                                                Container(
                                                  height: 48.hm(context),
                                                  width: 153.wm(context),
                                                  decoration: BoxDecoration(
                                                    color: ColorUtils.blue192,
                                                    borderRadius: BorderRadius.circular(8.rm(context),),
                                                  ),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                    onPressed: () async {
                                                      if(isEnglish.value == true) {
                                                        Get.updateLocale(Locale("en"));
                                                      } else {
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

                                                SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                                                Container(
                                                  height: 48.hm(context),
                                                  width: 153.wm(context),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: ColorUtils.gray136,width: 1),
                                                    color: ColorUtils.white255,
                                                    borderRadius: BorderRadius.circular(8.rm(context),),
                                                  ),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                    onPressed: () async {
                                                      Get.back();
                                                    },
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
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                                },
                              );
                            },
                            child: Container(
                              height: 54.hm(context),
                              width: 390.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Row(
                                children: [


                                  Expanded(
                                    child: Row(
                                      children: [


                                        Container(
                                          height: 24.hm(context),
                                          width: 24.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(ImagePathUtils.languageChangeIconImagePath),
                                          ),
                                        ),


                                        SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Change App Language".tr,
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
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.asset(
                                        Get.locale.toString() == "en" ?
                                        ImagePathUtils.arrowFilledIconImagePath :
                                        ImagePathUtils.arrowFilledBackIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                        SizedBox(
                          height: 54.hm(context),
                          width: 390.wm(context),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              Get.off(()=> TermsAndConditionsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                            },
                            child: Container(
                              height: 54.hm(context),
                              width: 390.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Row(
                                children: [


                                  Expanded(
                                    child: Row(
                                      children: [


                                        Container(
                                          height: 24.hm(context),
                                          width: 24.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(ImagePathUtils.termsAndConditionIconImagePath),
                                          ),
                                        ),


                                        SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Terms and Conditions".tr,
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
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.asset(
                                        Get.locale.toString() == "en" ?
                                        ImagePathUtils.arrowFilledIconImagePath :
                                        ImagePathUtils.arrowFilledBackIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                        SizedBox(
                          height: 54.hm(context),
                          width: 390.wm(context),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              Get.off(()=>HelpCenterScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                            },
                            child: Container(
                              height: 54.hm(context),
                              width: 390.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Row(
                                children: [


                                  Expanded(
                                    child: Row(
                                      children: [


                                        Container(
                                          height: 24.hm(context),
                                          width: 24.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(ImagePathUtils.helpCenterIconImagePath),
                                          ),
                                        ),


                                        SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Help Center".tr,
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
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.asset(
                                        Get.locale.toString() == "en" ?
                                        ImagePathUtils.arrowFilledIconImagePath :
                                        ImagePathUtils.arrowFilledBackIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),


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
                        Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
    ));
  }



}