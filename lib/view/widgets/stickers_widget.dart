import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/constants/form_validator_constant.dart';
import 'package:ifresh_originals_admin_panel/controller/sticker_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox stickerWidget(context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                largeText(
                    title: "Sticker",
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
                commonButton(
                    buttonName: "Add New Sticker",
                    buttonColor: redColor,
                    buttonWidth: 150,
                    buttonHeight: 60.h,
                    textColor: whiteColor,
                    textSize: 20.sp,
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return addStickerImagesAlertDialogWidget();
                          });
                    }
                )
              ],
            ),

            SizedBox(
              height: 25,
            ),
            GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 5,
              itemBuilder: (BuildContext ctx, index) {
                return stickerItemWidget(
                    image: "assets/Asset 240.png",
                    shirtName: "Lorem Ipsum",
                    onDelete: (){},
                    onEdit: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return editStickerImagesAlertDialogWidget();
                          });
                    }
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Sticker Item Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
Widget stickerItemWidget({String? image, String? shirtName, void Function()? onEdit, void Function()? onDelete}) {
  return Container(
    width: 140,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // -=-== ------ image ------ -=-==
          Container(
            width: 120.w,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              // image: DecorationImage(image: AssetImage("assets/Asset 80.png",),),
            ),
            child: Padding(
              padding:  EdgeInsets.all(15.r),
              child: Image(
                image: AssetImage(image!), height: 90.h, width: 90.w, fit: BoxFit.scaleDown,
              ),
            ),
          ),

          // -=-== ------ shirt name ------ -=-==
          commonText(
              title: shirtName,
              textStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16.sp,
              )
          ),
          // SizedBox(
          //   height: 40.h,
          // ),
          //--- - ===- = buttons =- === -  ---
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onEdit,
                child: Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 4.0, spreadRadius: 0.3)
                      ]
                  ),
                  child: Center(child: Icon(Icons.edit,size: 25.r,)),
                ),
              ),
              SizedBox(width: 8,),
              InkWell(
                onTap: onDelete,
                child: Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 4.0, spreadRadius: 0.3)
                      ]
                  ),
                  child: Center(child: Icon(CupertinoIcons.delete,size: 25.r,color: redColor,)),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}



// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Shirt Images Alert Dialog Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
AlertDialog addStickerImagesAlertDialogWidget() {
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
            return GetBuilder<StickerController>(
                init: StickerController(),
                builder: (controller) {
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // --- === button === ---
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            largeText(title: "Add New Sticker",fontWeight: FontWeight.w500),
                          ],),
                        SizedBox(height: 60.h,),
                        // ------====--------------------------------------------------------------===-----
                        // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                        // ------====--------------------------------------------------------------===-----
                        Form(
                          key: controller.stickerImageFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ----=-=--- shirt name form field ---=-=-----
                              Container(
                                width: 220.w,
                                decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:  BorderRadius.circular(40.0),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                    ]
                                ),
                                child: commonTextFormField(
                                    hintText: "Sticker Name",
                                    validator: FormValidatorConstant.commonValidator,
                                    controller: controller.stickerNameController
                                ),
                              ),

                            ],),
                        ),
                        // ------====--------------------------------------------------------------===-----
                        // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                        // ------====--------------------------------------------------------------===-----
                        SizedBox(height: 60.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //-=- ======== add front image button ======== -=-
                            Container(
                                width: 220.w,
                                decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:  BorderRadius.circular(10.0),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                    ]
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                                  child: Column(
                                    children: [
                                      smallText(
                                        title: "Add Sticker",
                                        color: blackColor,
                                      ),
                                      SizedBox(height: 10,),
                                      // controller.frontShirtImage != null ? Container(
                                      //     height: 100,
                                      //   width: 120.w,
                                      //   color: Colors.black45,
                                      //   child: Image(image: FileImage(
                                      //     controller.frontShirtImage!
                                      //   ), height: 60.h,width: 120.w,)
                                      // ) : Container(),

                                      SizedBox(height: 20,),
                                      commonButton(
                                          buttonName: "Add Sticker" ,
                                          onTap: (){
                                            controller.getStickerImage();
                                          },
                                          buttonColor: redColor,
                                          textColor: whiteColor,
                                          buttonWidth: 110,
                                          buttonHeight: 28,
                                          textSize: 10
                                      ),
                                    ],
                                  ),
                                )
                            ),

                          ],
                        ),
                        //----===--------------------- add button ------------------------====-----
                        SizedBox(height: 85.h,),
                        commonButton(
                          buttonName: "Add",
                          onTap: (){

                          },
                          buttonColor: redColor,
                          textColor: whiteColor,
                          buttonWidth: 250,
                          buttonHeight: 40,
                        ),

                      ]);
                }
            );
          })
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Shirt Images Alert Dialog Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
AlertDialog editStickerImagesAlertDialogWidget() {
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
            return GetBuilder<StickerController>(
                init: StickerController(),
                builder: (controller) {
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // --- === button === ---
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            largeText(title: "Update Sticker",fontWeight: FontWeight.w500),
                          ],),
                        SizedBox(height: 60.h,),
                        // ------====--------------------------------------------------------------===-----
                        // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                        // ------====--------------------------------------------------------------===-----
                        Form(
                          key: controller.editStickerImageFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ----=-=--- shirt name form field ---=-=-----
                              Container(
                                width: 220.w,
                                decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:  BorderRadius.circular(40.0),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                    ]
                                ),
                                child: commonTextFormField(
                                    hintText: "Sticker Name",
                                    validator: FormValidatorConstant.commonValidator,
                                    controller: controller.editedStickerNameController
                                ),
                              ),

                            ],),
                        ),
                        // ------====--------------------------------------------------------------===-----
                        // ---------------   ==-= =--------= update shirt images =--------= =-== -------------
                        // ------====--------------------------------------------------------------===-----
                        SizedBox(height: 60.h,),
                        Row(
                          children: [
                            //-=- ======== add front image button ======== -=-
                            Container(
                                width: 220.w,
                                decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:  BorderRadius.circular(10.0),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.2)
                                    ]
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                                  child: Column(
                                    children: [
                                      smallText(
                                        title: "Update Sticker",
                                        color: blackColor,
                                      ),
                                      SizedBox(height: 20,),
                                      commonButton(
                                          buttonName: "Update Sticker" ,
                                          onTap: (){
                                            controller.getEditStickerImage();
                                          },
                                          buttonColor: redColor,
                                          textColor: whiteColor,
                                          buttonWidth: 110,
                                          buttonHeight: 28,
                                          textSize: 10
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
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
                }
            );
          })
  );
}