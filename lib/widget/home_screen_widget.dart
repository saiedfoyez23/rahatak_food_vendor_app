import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/controller/profile_controller.dart';
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/utils/utils.dart';

import '../screen/screen.dart';

class HomeScreenWidget extends GetxController {


  final ProfileController profileController = Get.put(ProfileController());


  RxList<FoodDetails> foodDetails = <FoodDetails>[
    FoodDetails(
      name: "Tanoor",
      time: "10 Minutes",
      amount: "1.900 OMR",
      description: "Fresh oven bread stuffed with chicken or meat shawarma with special sauces and fresh vegetables.",
      image: "images/extra_image/p_list_1.png",
    ),
    FoodDetails(
        image: "images/extra_image/p_list_4.png",
        name: "Sandwich Packet",
        time: "20 Minutes",
        amount: "2.200 OMR",
        description: "An assortment of mini shawarma sandwiches, filled with various flavors and served with fries and appetizers."
    ),
    FoodDetails(
        image: "images/extra_image/p_list_3.png",
        name: "Chicken Fries",
        time: "10 Minutes", amount: "1.500 OMR",
        description: "Crispy fries topped with shawarma pieces, melted cheese, and special sauces."
    ),
    FoodDetails(
        image: "images/extra_image/p_list_2.png",
        name: "Meal Name",
        time: "15 Minutes",
        amount: "3.500 OMR",
        description: "Mini sandwich box with 3 delicious sauces such as garlic, hummus, and tahini, to add a rich flavor to your meal."),
  ].obs;


  Widget homeScreenWidget({required BuildContext context}) {

    return SafeArea(
      child: Obx(() => profileController.isLoading.value == true? Center(child: CircularProgressIndicator(color: AppColors.mainColor,),) : Container(
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

                  Container(
                    height: 55.hm(context),
                    width: 390.wm(context),
                    decoration: BoxDecoration(
                        color: ColorUtils.white255
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),


                        Row(
                          children: [

                            Expanded(
                              child: Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                child: Text(
                                  "Hello! How can we help you today?".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spm(context),
                                    color: ColorUtils.black255,
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              height: 28.hm(context),
                              width: 28.wm(context),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () {
                                  Get.off(()=>NotificationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                },
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                    ImagePathUtils.notificationIconImagePath,
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

                  Container(
                    height: 377.hm(context),
                    width: 390.wm(context),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [


                        SizedBox(
                          height: 377.hm(context),
                          width: 390.wm(context),
                        ),


                        Container(
                          height: 377.hm(context),
                          width: 390.wm(context),
                          decoration: BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Container(
                                height: 265.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child:  profileController.profile.value.data?.store != null?  Image.network("${profileController.profile.value.data?.store?.cover}") : Image.asset(
                                    ImagePathUtils.restaurantImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),


                        Container(
                          height: 370.hm(context),
                          width: 390.wm(context),
                          decoration: BoxDecoration(
                              color: Colors.transparent
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                children: [

                                  SpacerWidget.spacerWidget(spaceHeight: 4.hm(context)),


                                  Container(
                                    height: 40.hm(context),
                                    width: 40.wm(context),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent
                                    ),
                                  ),

                                ],
                              ),


                              Container(
                                width: 317.wm(context),
                                decoration: BoxDecoration(
                                  color: ColorUtils.white255,
                                  borderRadius: BorderRadius.circular(10.rm(context)),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.vpmm(context),
                                  horizontal: 12.hpmm(context),
                                ),
                                child: Row(
                                  children: [


                                    Container(
                                      height: 100.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: ColorUtils.white217,width: 0.5),
                                          right: BorderSide(color: ColorUtils.white217,width: 0.5),
                                          left: BorderSide(color: ColorUtils.white217,width: 0.5),
                                          bottom: BorderSide(color: ColorUtils.white217,width: 0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(10.rm(context)),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: profileController.profile.value.data?.store != null? Image.network("${profileController.profile.value.data?.store?.image}") : Image.asset(
                                          ImagePathUtils.extraImageGrid_2,
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
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
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: Text("${profileController.profile.value.data?.store?.name}",
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                            height: 20,
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: ListView.builder(
                                                itemCount: profileController.profile.value.data?.store?.categories.length,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context,index){
                                              return Text("${profileController.profile.value.data?.store?.categories[index].name}, ",
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.spm(context),
                                                  color: ColorUtils.gray117,
                                                ),
                                              );
                                            })
                                          ),

                                          SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    ImagePathUtils.starIconImagePath,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),

                                              SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text("${profileController.profile.value.data?.store?.ratings}",
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


                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    ImagePathUtils.locationIconImagePath,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),

                                              SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text("${profileController.profile.value.data?.store?.locations[0].governorate}, ${profileController.profile.value.data?.store?.locations[0].state}",
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


                                  ],
                                ),
                              ),




                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ],
              ),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                child: Column(
                  children: [

                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),

                    Container(
                      height: 48.hm(context),
                      width: 220.wm(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.rm(context)),
                          color: ColorUtils.green142
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.vpmm(context),horizontal: 2.hpmm(context)),
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${profileController.profile.value.data?.store?.status}".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.spm(context),
                            color: ColorUtils.white255,
                          ),
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 19.hm(context)),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Menu".tr,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.spm(context),
                              color: ColorUtils.black30,
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
                                        top: 460.tpmm(context),
                                        bottom: 124.tpmm(context),
                                        left: Get.locale.toString() == "en" ? 277.lpmm(context) : 16.rpmm(context),
                                        right: Get.locale.toString() == "en" ? 16.rpmm(context) : 277.lpmm(context)
                                    ),
                                    child: Container(
                                      height: 88.hm(context),
                                      width: 150.wm(context),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white255,
                                        borderRadius: BorderRadius.circular(10.rm(context)),
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
                                            height: 42.hm(context),
                                            width: 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Burger".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Pasta".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Shawarma".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Fries".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 42.hm(context),
                                            width: 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Drinks".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.spm(context),
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

                    SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),
                  ],
                ),
              ),
            ),


            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context,int index) {
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
                        border: Border.all(color: ColorUtils.white217,width: 1),
                      ),
                      margin: EdgeInsets.only(
                        bottom: 10.bpmm(context),
                      ),
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
                                child: Image.asset(
                                  foodDetails[index].image,
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
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
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      foodDetails[index].name.tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      foodDetails[index].description.tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
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
                                              foodDetails[index].time.tr,
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
                                          "${foodDetails[index].amount}".tr,
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

                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: foodDetails.length,
              ),
            ),


          ],
        ),
      ),)
    );
  }



}



class FoodDetails {

  String name;
  String time;
  String image;
  String amount;
  String description;

  FoodDetails({
    required this.name,
    required this.time,
    required this.image,
    required this.amount,
    required this.description,
  });
}