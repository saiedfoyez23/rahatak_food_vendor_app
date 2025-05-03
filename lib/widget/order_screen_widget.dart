import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/utils/utils.dart';

class OrderScreenWidget extends GetxController {

  RxString changeOrder = "New Orders".obs;
  RxString firstChangeStatus = "".obs;
  RxBool firstOrderTrack = false.obs;
  RxBool firstOrder = false.obs;

  RxString secondChangeStatus = "".obs;
  RxBool secondOrderTrack = false.obs;
  RxBool secondOrder = false.obs;


  RxString thirdChangeStatus = "".obs;
  RxBool thirdOrderTrack = false.obs;
  RxBool thirdOrder = false.obs;

  Widget orderScreenWidget({required BuildContext context}) {
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
              child: Directionality(
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

                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              changeOrder.value.tr,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black255,
                              ),
                            ),
                          ),


                          Container(
                            height: 24.hm(context),
                            width: 24.wm(context),
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
                                          bottom: MediaQuery.sizeOf(context).height > 1000 ? 900.tpmt(context) : 600.tpmm(context),
                                          left: MediaQuery.sizeOf(context).width > 500 ? 557.rpmt(context) : 232.rpmm(context),
                                          right: MediaQuery.sizeOf(context).width > 500 ? 37.lpmt(context) : 16.lpmm(context)
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
                                                  Get.back();
                                                  changeOrder.value = "New Orders";
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "New Orders".tr,
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
                                                  changeOrder.value = "Ongoing Orders";
                                                  Get.back();
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Ongoing Orders".tr,
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
                                                  changeOrder.value = "Completed Orders";
                                                  Get.back();
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Completed Orders".tr,
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
                                                  changeOrder.value = "Cancelled Orders";
                                                  Get.back();
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Cancelled Orders".tr,
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
                                  ImagePathUtils.listShowImagePath,
                                  fit: BoxFit.cover,
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
              ),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                child: changeOrder.value == "New Orders" ?
                Column(
                  children: [


                    Container(
                      width: 390.wm(context),
                      padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 8.hpmm(context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.gray155,width: .5),
                          borderRadius: BorderRadius.circular(10.rm(context))
                      ),
                      child: Column(
                        children: [


                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "Abdullah".tr,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "124353".tr,
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
                                  borderRadius: BorderRadius.circular(8.rm(context),),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () async {
                                    Get.back();
                                  },
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
                              ),),

                              SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                              Expanded(
                                child: Container(
                                height: 48.hm(context),
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
                              ),),


                            ],
                          ),



                        ],
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                    Container(
                      width: 390.wm(context),
                      padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 8.hpmm(context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.gray155,width: .5),
                          borderRadius: BorderRadius.circular(10.rm(context))
                      ),
                      child: Column(
                        children: [


                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "Fahd".tr,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "234545".tr,
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
                                    borderRadius: BorderRadius.circular(8.rm(context),),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      Get.back();
                                    },
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
                                ),),

                              SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                              Expanded(
                                child: Container(
                                  height: 48.hm(context),
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
                                ),),


                            ],
                          ),





                        ],
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                    Container(
                      width: 390.wm(context),
                      padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 8.hpmm(context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.gray155,width: .5),
                          borderRadius: BorderRadius.circular(10.rm(context))
                      ),
                      child: Column(
                        children: [


                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "Mohammed".tr,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "735426".tr,
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
                                    borderRadius: BorderRadius.circular(8.rm(context),),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      Get.back();
                                    },
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
                                ),),

                              SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                              Expanded(
                                child: Container(
                                  height: 48.hm(context),
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
                                ),),


                            ],
                          ),





                        ],
                      ),
                    ),



                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),



                  ],
                ) :
                Column(
                  children: [


                    Container(
                      width: 390.wm(context),
                      padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 8.hpmm(context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.gray155,width: .5),
                          borderRadius: BorderRadius.circular(10.rm(context))
                      ),
                      child: Column(
                        children: [


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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


                              Column(
                                children: [
                                  Container(
                                    height: 40.hm(context),
                                    width: 145.wm(context),
                                    padding: EdgeInsets.symmetric(vertical: 5.vpmm(context),horizontal: 5.hpmm(context)),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.rm(context)),
                                      border: Border.all(color: ColorUtils.white217,width: 0.5),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        if(firstOrderTrack.value == false) {
                                          firstOrderTrack.value = true;
                                        } else {
                                          firstOrderTrack.value = false;
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            firstChangeStatus.value == "" ? "Order Status".tr : firstChangeStatus.value.tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.spm(context),
                                              color: ColorUtils.black51,
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                          Icon(firstOrderTrack.value == false ? Icons.keyboard_arrow_up_rounded :Icons.keyboard_arrow_down_rounded,size: 15.sm(context),color: ColorUtils.black51,),

                                        ],
                                      ),
                                    ),
                                  ),
                                  firstOrderTrack.value == false ?
                                  SpacerWidget.spacerWidget() :
                                  Container(
                                    width: 145.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.rm(context)),
                                      border: Border.all(color: ColorUtils.white217,width: 0.5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 42.hm(context),
                                          width: 145.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () async {
                                              firstOrderTrack.value= false;
                                              firstChangeStatus.value =  "In Process";
                                            },
                                            child: Center(
                                              child: Text(
                                                "In Process".tr,
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
                                        ),
                                        Container(
                                          height: 42.hm(context),
                                          width: 145.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () async {
                                              firstOrderTrack.value= false;
                                              firstChangeStatus.value =  "Being Prepared";
                                            },
                                            child: Center(
                                              child: Text(
                                                "Being Prepared".tr,
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
                                        ),
                                        Container(
                                          height: 42.hm(context),
                                          width: 145.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () async {
                                              firstOrderTrack.value= false;
                                              firstChangeStatus.value =  "Prepared";
                                            },
                                            child: Center(
                                              child: Text(
                                                "Prepared".tr,
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
                                        ),
                                        Container(
                                          height: 42.hm(context),
                                          width: 145.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () async {
                                              firstOrderTrack.value= false;
                                              firstChangeStatus.value =  "Delivery in progress";
                                            },
                                            child: Center(
                                              child: Text(
                                                "Delivery in progress".tr,
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
                                        ),
                                        Container(
                                          height: 42.hm(context),
                                          width: 145.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () async {
                                              firstOrderTrack.value= false;
                                              firstChangeStatus.value =  "Complete";
                                            },
                                            child: Center(
                                              child: Text(
                                                "Complete".tr,
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
                                        ),
                                        Container(
                                          height: 42.hm(context),
                                          width: 145.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () async {
                                              firstOrderTrack.value= false;
                                              firstChangeStatus.value =  "Cancelled";
                                            },
                                            child: Center(
                                              child: Text(
                                                "Cancelled".tr,
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
                                        ),
                                      ],
                                    )
                                  ),
                                ],
                              ),

                            ],
                          ),



                          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),

                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "Abdullah".tr,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "124353".tr,
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

                          Container(
                            height: 1.5.hm(context),
                            width: 390.wm(context),
                            decoration: BoxDecoration(
                                color: ColorUtils.white217
                            ),
                          ),



                          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),


                          Container(
                            height: 37.hm(context),
                            width: 390.wm(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                if(firstOrder.value == false) {
                                  firstOrder.value = true;
                                } else {
                                  firstOrder.value = false;
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Order Details".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.spm(context),
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),

                                  SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),


                                  Icon(firstOrder.value == false ? Icons.keyboard_arrow_up_rounded :Icons.keyboard_arrow_down_rounded,size: 25.sm(context),color: ColorUtils.blue192,),





                                ],
                              ),
                            ),
                          ),

                          firstOrder.value == false ?
                          SpacerWidget.spacerWidget() :
                          Column(
                            children: [

                              SpacerWidget.spacerWidget(spaceHeight: 13.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Tanoore".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "1.900 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 1".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_4,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Sandwich Pack".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "2.200 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 2".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),

                              SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Chicken Fries".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "3.000 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 2".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),


                              Container(
                                height: 1.5.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: ColorUtils.white217
                                ),
                              ),



                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                          )





                        ],
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                    Container(
                      width: 390.wm(context),
                      padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 8.hpmm(context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.gray155,width: .5),
                          borderRadius: BorderRadius.circular(10.rm(context))
                      ),
                      child: Column(
                        children: [


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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


                              Column(
                                children: [
                                  Container(
                                    height: 40.hm(context),
                                    width: 145.wm(context),
                                    padding: EdgeInsets.symmetric(vertical: 5.vpmm(context),horizontal: 5.hpmm(context)),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.rm(context)),
                                      border: Border.all(color: ColorUtils.white217,width: 0.5),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        if(secondOrderTrack.value == false) {
                                          secondOrderTrack.value = true;
                                        } else {
                                          secondOrderTrack.value = false;
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            secondChangeStatus.value == "" ? "Order Status".tr : secondChangeStatus.value.tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.spm(context),
                                              color: ColorUtils.black51,
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                          Icon(secondOrderTrack.value == false ? Icons.keyboard_arrow_up_rounded :Icons.keyboard_arrow_down_rounded,size: 15.sm(context),color: ColorUtils.black51,),

                                        ],
                                      ),
                                    ),
                                  ),
                                  secondOrderTrack.value == false ?
                                  SpacerWidget.spacerWidget() :
                                  Container(
                                      width: 145.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10.rm(context)),
                                        border: Border.all(color: ColorUtils.white217,width: 0.5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                secondOrderTrack.value= false;
                                                secondChangeStatus.value =  "In Process";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "In Process".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                secondOrderTrack.value= false;
                                                secondChangeStatus.value =  "Being Prepared";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Being Prepared".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                secondOrderTrack.value= false;
                                                secondChangeStatus.value =  "Prepared";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Prepared".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                secondOrderTrack.value= false;
                                                secondChangeStatus.value =  "Delivery in progress";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Delivery in progress".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                secondOrderTrack.value= false;
                                                secondChangeStatus.value =  "Complete";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Complete".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                secondOrderTrack.value= false;
                                                secondChangeStatus.value =  "Cancelled";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Cancelled".tr,
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
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),

                            ],
                          ),



                          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),

                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "Abdullah".tr,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "124353".tr,
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

                          Container(
                            height: 1.5.hm(context),
                            width: 390.wm(context),
                            decoration: BoxDecoration(
                                color: ColorUtils.white217
                            ),
                          ),



                          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),


                          Container(
                            height: 37.hm(context),
                            width: 390.wm(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                if(secondOrder.value == false) {
                                  secondOrder.value = true;
                                } else {
                                  secondOrder.value = false;
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Order Details".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.spm(context),
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),

                                  SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),


                                  Icon(secondOrder.value == false ? Icons.keyboard_arrow_up_rounded :Icons.keyboard_arrow_down_rounded,size: 25.sm(context),color: ColorUtils.blue192,),





                                ],
                              ),
                            ),
                          ),

                          secondOrder.value == false ?
                          SpacerWidget.spacerWidget() :
                          Column(
                            children: [

                              SpacerWidget.spacerWidget(spaceHeight: 13.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Tanoore".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "1.900 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 1".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_4,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Sandwich Pack".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "2.200 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 2".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),

                              SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Chicken Fries".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "3.000 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 2".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),


                              Container(
                                height: 1.5.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: ColorUtils.white217
                                ),
                              ),



                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                          )





                        ],
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                    Container(
                      width: 390.wm(context),
                      padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 8.hpmm(context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.gray155,width: .5),
                          borderRadius: BorderRadius.circular(10.rm(context))
                      ),
                      child: Column(
                        children: [


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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


                              Column(
                                children: [
                                  Container(
                                    height: 40.hm(context),
                                    width: 145.wm(context),
                                    padding: EdgeInsets.symmetric(vertical: 5.vpmm(context),horizontal: 5.hpmm(context)),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.rm(context)),
                                      border: Border.all(color: ColorUtils.white217,width: 0.5),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        if(thirdOrderTrack.value == false) {
                                          thirdOrderTrack.value = true;
                                        } else {
                                          thirdOrderTrack.value = false;
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            thirdChangeStatus.value == "" ? "Order Status".tr : thirdChangeStatus.value.tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.spm(context),
                                              color: ColorUtils.black51,
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                          Icon(thirdOrderTrack.value == false ? Icons.keyboard_arrow_up_rounded :Icons.keyboard_arrow_down_rounded,size: 15.sm(context),color: ColorUtils.black51,),

                                        ],
                                      ),
                                    ),
                                  ),
                                  thirdOrderTrack.value == false ?
                                  SpacerWidget.spacerWidget() :
                                  Container(
                                      width: 145.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10.rm(context)),
                                        border: Border.all(color: ColorUtils.white217,width: 0.5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                thirdOrderTrack.value= false;
                                                thirdChangeStatus.value =  "In Process";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "In Process".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                thirdOrderTrack.value= false;
                                                thirdChangeStatus.value =  "Being Prepared";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Being Prepared".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                thirdOrderTrack.value= false;
                                                thirdChangeStatus.value =  "Prepared";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Prepared".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                thirdOrderTrack.value= false;
                                                thirdChangeStatus.value =  "Delivery in progress";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Delivery in progress".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                thirdOrderTrack.value= false;
                                                thirdChangeStatus.value =  "Complete";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Complete".tr,
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
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 145.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                thirdOrderTrack.value= false;
                                                thirdChangeStatus.value =  "Cancelled";
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Cancelled".tr,
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
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),

                            ],
                          ),



                          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),

                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "Abdullah".tr,
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
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                            child: Text(
                              "124353".tr,
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

                          Container(
                            height: 1.5.hm(context),
                            width: 390.wm(context),
                            decoration: BoxDecoration(
                                color: ColorUtils.white217
                            ),
                          ),



                          SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),


                          Container(
                            height: 37.hm(context),
                            width: 390.wm(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                if(thirdOrder.value == false) {
                                  thirdOrder.value = true;
                                } else {
                                  thirdOrder.value = false;
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Order Details".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.spm(context),
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),

                                  SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),


                                  Icon(thirdOrder.value == false ? Icons.keyboard_arrow_up_rounded :Icons.keyboard_arrow_down_rounded,size: 25.sm(context),color: ColorUtils.blue192,),





                                ],
                              ),
                            ),
                          ),

                          thirdOrder.value == false ?
                          SpacerWidget.spacerWidget() :
                          Column(
                            children: [

                              SpacerWidget.spacerWidget(spaceHeight: 13.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Tanoore".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "1.900 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 1".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_4,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Sandwich Pack".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "2.200 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 2".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),

                              SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),


                              Container(
                                width: 390.wm(context),
                                padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.pList_3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Chicken Fries".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "3.000 OMR".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Quantity: 2".tr,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                            child: Text(
                                              "Size: Middle".tr,
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
                              ),


                              Container(
                                height: 1.5.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: ColorUtils.white217
                                ),
                              ),



                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
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
                          )





                        ],
                      ),
                    ),



                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),

                
                
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