import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_vendor_app/utils/utils.dart';
import 'package:rahatak_food_vendor_app/widget/widget.dart';

class MenuScreenWidget extends GetxController {

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
      
      
                                  SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
      
      
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
      
      
                                  SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
      
      
                                ],
                              ),
                            ),



                            SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),



                            Column(
                              children: [




                              ],
                            )
      
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
      ),
    );
  }



}


