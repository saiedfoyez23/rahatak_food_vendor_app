import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screen/screen.dart';
import '../utils.dart';

class BottomNavigationBarWidget {

  Widget bottomNavigationBarWidget({
    required BuildContext context,
    required bool isHomeFocus,
    required bool isMenuFocus,
    required bool isOrderFocus,
    required bool isProfileFocus,
  }) {
    if(MediaQuery.of(context).size.height > 1133) {
      return  Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: 84.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.hpmt(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                   Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isHomeFocus == true ? ImagePathUtils.homeIconFocusImagePath : ImagePathUtils.homeIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "Home".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isHomeFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>MenuScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isMenuFocus == true ? ImagePathUtils.menuIconFocusImagePath : ImagePathUtils.menuIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "Menu".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isMenuFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>OrderScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isOrderFocus == true ? ImagePathUtils.orderTrackIconFocusImagePath : ImagePathUtils.orderTrackIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "Order".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isOrderFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),


              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isProfileFocus == true ? ImagePathUtils.profileFocusIconImagePath : ImagePathUtils.profileUnfocusIconImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "My Account".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isProfileFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),



            ],
          ),
        ),
      );
    } else {
      return  Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: 84.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.hpmm(context)),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                   Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isHomeFocus == true ? ImagePathUtils.homeIconFocusImagePath : ImagePathUtils.homeIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Home".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isHomeFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),


              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                   Get.off(()=>MenuScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isMenuFocus == true ? ImagePathUtils.menuIconFocusImagePath : ImagePathUtils.menuIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Menu".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isMenuFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),


              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>OrderScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isOrderFocus == true ? ImagePathUtils.orderTrackIconFocusImagePath : ImagePathUtils.orderTrackIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Order".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isOrderFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),


              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isProfileFocus == true ? ImagePathUtils.profileFocusIconImagePath : ImagePathUtils.profileUnfocusIconImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Profile".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isProfileFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



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



}