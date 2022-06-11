import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/constants/form_validator_constant.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox priceWidget(context) {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            largeText(
                title: "Prices",
                color: Colors.black,
                fontWeight: FontWeight.w600
            ),
            SizedBox(
              height: 10,
            ),
            commonText(
                title: "Add price of stickers, texts, and images on Shirts",
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 13
                )
            ),
            SizedBox(
              height: 25,
            ),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                pricesItemWidget(
                    image: "assets/Asset 110.png",
                    noOfShirt: "2",
                    priceFor: "Per Text Price",
                    onButtonTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return textPriceAlertDialogWidget();
                          });
                    }
                ),
                pricesItemWidget(
                    image: "assets/Asset 90.png",
                    noOfShirt: "2",
                    priceFor: "Per Sticker Price",
                    onButtonTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return stickerPriceAlertDialogWidget();
                          });
                    }
                ),
                pricesItemWidget(
                    image: "assets/Asset 80.png",
                    noOfShirt: "4",
                    priceFor: "Per Image On Shirt Price",
                    onButtonTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return imageOnShirtsPriceAlertDialogWidget();
                          });
                    }
                ),
                deliveryPricesItemWidget(
                    image: "assets/Asset 120.png",
                    firstDeliveryPrice: "5",
                    secondDeliveryPrice: "7",
                    thirdDeliveryPrice: "8",
                    onButtonTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return deliveryPriceAlertDialogWidget();
                          });
                    }
                )

              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    ),
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Prices Item Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
Widget pricesItemWidget({String? priceFor, String? image, String? noOfShirt, void Function()? onButtonTap}) {
  return Container(
    height: 230,
    width: 230,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5,),
          // -=-== ------ image ------ -=-==
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
              // image: DecorationImage(image: AssetImage("assets/Asset 80.png",),),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                image: AssetImage(image!), height: 50, width: 50, fit: BoxFit.scaleDown,
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
          //-=-=--==-=-  Price   -=--=-=-==-
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText(
                        title: priceFor,
                        textStyle: TextStyle(
                            color: blackColor,
                            fontSize: 13,
                        )
                    ),
                    SizedBox(width: 15,),
                    commonText(
                        title: noOfShirt,
                        textStyle: TextStyle(
                            color: redColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ],
                ),
                commonButton(
                    buttonHeight: 30,
                    buttonWidth: 120,
                    buttonColor: redColor,
                    buttonName: "Update",
                    onTap: onButtonTap,
                    textSize: 12,
                    textColor: whiteColor
                )
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Delivery Prices Item Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
Widget deliveryPricesItemWidget({ String? image, String? firstDeliveryPrice,
  String? secondDeliveryPrice, String? thirdDeliveryPrice, void Function()? onButtonTap}) {
  return Container(
    height: 230,
    width: 230,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5,),
          // -=-== ------ image ------ -=-==
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
              // image: DecorationImage(image: AssetImage("assets/Asset 80.png",),),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                image: AssetImage(image!), height: 50, width: 50, fit: BoxFit.scaleDown,
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          //-=-=--==-=-  Price   -=--=-=-==-
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText(
                        title: "Delivery in 3-6 Price:",
                        textStyle: TextStyle(
                          color: blackColor,
                          fontSize: 9,
                        )
                    ),
                    SizedBox(width: 15,),
                    commonText(
                        title: firstDeliveryPrice,
                        textStyle: TextStyle(
                            color: redColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText(
                        title: "Delivery in 4-8 Price:",
                        textStyle: TextStyle(
                          color: blackColor,
                          fontSize: 9,
                        )
                    ),
                    SizedBox(width: 15,),
                    commonText(
                        title: secondDeliveryPrice,
                        textStyle: TextStyle(
                            color: redColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText(
                        title: "Delivery in 8-10 Price:",
                        textStyle: TextStyle(
                          color: blackColor,
                          fontSize: 9,
                        )
                    ),
                    SizedBox(width: 15,),
                    commonText(
                        title: thirdDeliveryPrice,
                        textStyle: TextStyle(
                            color: redColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ],
                ),
                commonButton(
                    buttonHeight: 30,
                    buttonWidth: 120,
                    buttonColor: redColor,
                    buttonName: "Update",
                    onTap: onButtonTap,
                    textSize: 12,
                    textColor: whiteColor
                )
              ],
            ),
          ),

        ],
      ),
    ),
  );
}


// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Shirt Images Alert Dialog Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
AlertDialog textPriceAlertDialogWidget() {
  return AlertDialog(
      scrollable: true,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15))),
      backgroundColor: bgColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      content: Builder(
          builder: (context) {
            return  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // --- === button === ---
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 1,),
                            largeText(title: "Update Text Price",fontWeight: FontWeight.w500),
                            InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Icon(CupertinoIcons.clear))
                          ],),
                        SizedBox(height: 60.h,),
                        // ------====--------------------------------------------------------------===-----
                        // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                        // ------====--------------------------------------------------------------===-----
                        Form(
                          // key: controller.editShirtImageFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ----=-=--- shirt name form field ---=-=-----
                              Container(
                                width: 250,
                                decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:  BorderRadius.circular(40.0),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                    ]
                                ),
                                child: commonTextFormField(
                                    hintText: "Text Price",
                                    validator: FormValidatorConstant.commonValidator,
                                    // controller: controller.editedShirtNameController
                                ),
                              ),
                            ],),
                        ),

                        //----===--------------------- add button ------------------------====-----
                        SizedBox(height: 85.h,),
                        commonButton(
                          buttonName: "Update",
                          onTap: (){

                          },
                          buttonColor: redColor,
                          textColor: whiteColor,
                          buttonWidth: 250,
                          buttonHeight: 40,
                        ),

                      ]);

          })
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Shirt Images Alert Dialog Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
AlertDialog stickerPriceAlertDialogWidget() {
  return AlertDialog(
      scrollable: true,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15))),
      backgroundColor: bgColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      content: Builder(
          builder: (context) {
            return  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- === button === ---
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 1,),
                      largeText(title: "Update Sticker Price",fontWeight: FontWeight.w500),
                      InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(CupertinoIcons.clear))
                    ],),
                  SizedBox(height: 60.h,),
                  // ------====--------------------------------------------------------------===-----
                  // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                  // ------====--------------------------------------------------------------===-----
                  Form(
                    // key: controller.editShirtImageFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ----=-=--- shirt name form field ---=-=-----
                        Container(
                          width: 250,
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius:  BorderRadius.circular(40.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                              ]
                          ),
                          child: commonTextFormField(
                            hintText: "Sticker Price",
                            validator: FormValidatorConstant.commonValidator,
                            // controller: controller.editedShirtNameController
                          ),
                        ),
                      ],),
                  ),

                  //----===--------------------- add button ------------------------====-----
                  SizedBox(height: 85.h,),
                  commonButton(
                    buttonName: "Update",
                    onTap: (){

                    },
                    buttonColor: redColor,
                    textColor: whiteColor,
                    buttonWidth: 250,
                    buttonHeight: 40,
                  ),

                ]);

          })
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Shirt Images Alert Dialog Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
AlertDialog imageOnShirtsPriceAlertDialogWidget() {
  return AlertDialog(
      scrollable: true,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15))),
      backgroundColor: bgColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      content: Builder(
          builder: (context) {
            return  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- === button === ---
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      largeText(title: "Update Image On Shirts Price",fontWeight: FontWeight.w500),
                      InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(CupertinoIcons.clear))
                    ],),
                  SizedBox(height: 60.h,),
                  // ------====--------------------------------------------------------------===-----
                  // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                  // ------====--------------------------------------------------------------===-----
                  Form(
                    // key: controller.editShirtImageFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ----=-=--- shirt name form field ---=-=-----
                        Container(
                          width: 250,
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius:  BorderRadius.circular(40.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                              ]
                          ),
                          child: commonTextFormField(
                            hintText: "Image On Shirts Price",
                            validator: FormValidatorConstant.commonValidator,
                            // controller: controller.editedShirtNameController
                          ),
                        ),
                      ],),
                  ),

                  //----===--------------------- add button ------------------------====-----
                  SizedBox(height: 85.h,),
                  commonButton(
                    buttonName: "Update",
                    onTap: (){

                    },
                    buttonColor: redColor,
                    textColor: whiteColor,
                    buttonWidth: 250,
                    buttonHeight: 40,
                  ),

                ]);

          })
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Shirt Images Alert Dialog Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
AlertDialog deliveryPriceAlertDialogWidget() {
  return AlertDialog(
      scrollable: true,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15))),
      backgroundColor: bgColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      content: Builder(
          builder: (context) {
            return  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- === button === ---
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 1,),
                      largeText(title: "Update Delivery Price",fontWeight: FontWeight.w500),
                      InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(CupertinoIcons.clear))
                    ],),
                  SizedBox(height: 60.h,),
                  // ------====--------------------------------------------------------------===-----
                  // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                  // ------====--------------------------------------------------------------===-----
                  Form(
                    // key: controller.editShirtImageFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ----=-=--- shirt name form field ---=-=-----
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                smallText(
                                  title: "   3-6 Days Delivery Price."
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: 250,
                                  decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:  BorderRadius.circular(40.0),
                                      boxShadow: const [
                                        BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                      ]
                                  ),
                                  child: commonTextFormField(
                                    hintText: "Price",
                                    validator: FormValidatorConstant.commonValidator,
                                    // controller: controller.editedShirtNameController
                                  ),
                                ),
                              ],
                            ),

                          ],),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ----=-=--- shirt name form field ---=-=-----
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                smallText(
                                    title: "   4-8 Days Delivery Price."
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: 250,
                                  decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:  BorderRadius.circular(40.0),
                                      boxShadow: const [
                                        BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                      ]
                                  ),
                                  child: commonTextFormField(
                                    hintText: "Price",
                                    validator: FormValidatorConstant.commonValidator,
                                    // controller: controller.editedShirtNameController
                                  ),
                                ),
                              ],
                            ),

                          ],),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ----=-=--- shirt name form field ---=-=-----
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                smallText(
                                    title: "   8-10 Days Delivery Price."
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: 250,
                                  decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:  BorderRadius.circular(40.0),
                                      boxShadow: const [
                                        BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                      ]
                                  ),
                                  child: commonTextFormField(
                                    hintText: "Price",
                                    validator: FormValidatorConstant.commonValidator,
                                    // controller: controller.editedShirtNameController
                                  ),
                                ),
                              ],
                            ),

                          ],),
                      ],
                    ),
                  ),

                  //----===--------------------- add button ------------------------====-----
                  SizedBox(height: 85.h,),
                  commonButton(
                    buttonName: "Update",
                    onTap: (){

                    },
                    buttonColor: redColor,
                    textColor: whiteColor,
                    buttonWidth: 250,
                    buttonHeight: 40,
                  ),

                ]);

          })
  );
}