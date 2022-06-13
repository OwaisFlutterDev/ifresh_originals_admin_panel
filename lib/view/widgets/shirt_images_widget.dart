import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/constants/form_validator_constant.dart';
import 'package:ifresh_originals_admin_panel/controller/shirt_images_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';


Widget shirtWidget(context) {
 final ShirtImagesController shirtImagesController = Get.put(ShirtImagesController());
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
                    title: "Shirt Images",
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
                commonButton(
                  buttonName: "Add New Shirt",
                  buttonColor: redColor,
                  buttonWidth: 150,
                  buttonHeight: 37,
                  textColor: whiteColor,
                  textSize: 12,
                  onTap: (){

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return addShirtImagesAlertDialogWidget(
                          );
                        });
                  }
                )
              ],
            ),

            SizedBox(
              height: 25,
            ),
            Obx(() =>
                GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 0.78,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: shirtImagesController.shirtsDataList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return shirtImageItemWidget(
                        image: shirtImagesController.shirtsDataList[index].frontImage,
                        shirtName: shirtImagesController.shirtsDataList[index].shirtName,
                        deleteButton: (){},
                        editButton: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                shirtImagesController.editedShirtNameController.text = shirtImagesController.shirtsDataList[index].shirtName.toString();
                                shirtImagesController.editedShirtPriceController.text = shirtImagesController.shirtsDataList[index].shirtPrice.toString();

                                return editShirtImagesAlertDialogWidget(
                                   frontImage:  shirtImagesController.shirtsDataList[index].frontImage,
                                   backImage: shirtImagesController.shirtsDataList[index].backImage,
                                  id:  shirtImagesController.shirtsDataList[index].id
                                );
                              });
                        }
                    );
                  },
                ),
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
// ---------------   ==-= =--------= Shirt Image Item Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
Widget shirtImageItemWidget({String? image, String? shirtName,
  void Function()? editButton, void Function()? deleteButton
})
{
  return Container(

    width: 210,
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
            // width: 120.w,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
               // image: DecorationImage(image: NetworkImage(image!,),),
            ),
            child: Padding(
              padding:  EdgeInsets.all(10),
              child: Image.network(image!,height: 120, width: 150, fit: BoxFit.scaleDown,)

              // Image(
              //   image: NetworkImage(image!), height: 120, width: 150, fit: BoxFit.scaleDown,
              // ),
            ),
          ),

          // SizedBox(
          //   height: 40.h,
          // ),
          // -=-== ------ shirt name ------ -=-==
          commonText(
              title: shirtName,
              textStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
              )
          ),
          // SizedBox(
          //   height: 40.h,
          // ),
          //--- - ===- = buttons =- === -  ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: editButton,
                child: Container(
                   height: 28,
                    width: 28,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 4.0, spreadRadius: 0.3)
                      ]
                  ),
                  child: Center(child: Icon(Icons.edit,size: 18,)),
                ),
              ),

              InkWell(
                onTap: deleteButton,
                child: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 4.0, spreadRadius: 0.3)
                      ]
                  ),
                  child: Center(child: Icon(CupertinoIcons.delete,size: 18,color: redColor,)),
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
AlertDialog addShirtImagesAlertDialogWidget() {
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
            return GetBuilder<ShirtImagesController>(
              init: ShirtImagesController(),
              builder: (controller) {
                return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // --- === button === ---
                            SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 1,),
                                largeText(title: "Add New Image",fontWeight: FontWeight.w500),
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
                              key: controller.shirtImageFormKey,
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
                                        hintText: "Shirt Name",
                                        validator: FormValidatorConstant.commonValidator,
                                        controller: controller.shirtNameController
                                    ),
                                  ),
                                  // ----=-=--- shirt price form field ---=-=-----
                                  SizedBox(width: 40.w,),
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
                                      hintText: "Shirt Price",
                                      validator: FormValidatorConstant.commonValidator,
                                      controller: controller.shirtPriceController
                                    ),
                                  ),
                                ],),
                            ),
                            // ------====--------------------------------------------------------------===-----
                            // ---------------   ==-= =--------= text form fields =--------= =-== -------------
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
                                          title: "Add Front Image",
                                          color: blackColor,
                                        ),
                                        SizedBox(height: 10,),
                                        controller.frontShirtImage == null ? Container() :
                                        Container(
                                          height: 150,
                                          width: 200.w,
                                          color: Colors.transparent,
                                          child: Image.memory(controller.frontShirtWeb)
                                        ),

                                        SizedBox(height: 20,),
                                        commonButton(
                                          buttonName: "Add Image" ,
                                          onTap: (){
                                            controller.getFrontShirtImage();
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
                                //-=- ======== add front image button ======== -=-
                                SizedBox(width: 40.w,),
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
                                            title: "Add Back Image",
                                            color: blackColor,
                                          ),
                                          SizedBox(height: 10,),
                                          controller.backShirtImage == null ? Container() :
                                          Container(
                                              height: 150,
                                              width: 200.w,
                                              color: Colors.transparent,
                                              child: Image.memory(controller.backShirtWeb)
                                          ),
                                          SizedBox(height: 20,),

                                          commonButton(
                                              buttonName: "Add Image" ,
                                              onTap: (){
                                                controller.getBackShirtImage();
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
                            controller.addShirtBool ? CircularProgressIndicator() :  commonButton(
                                buttonName: "Add",
                                onTap: (){
                                  if (controller.shirtImageFormKey.currentState!.validate() &&
                                      controller.frontShirtImage != null &&  controller.backShirtImage != null)
                                  {
                                    controller.addShirtImages();
                                  } else {
                                    Get.snackbar("Add Shirt Data",
                                        "Please Fill All The Fields.",
                                        duration: Duration(seconds: 3));
                                  }
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
AlertDialog editShirtImagesAlertDialogWidget({String? frontImage, String? backImage, String? id}) {
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
            return GetBuilder<ShirtImagesController>(
                init: ShirtImagesController(),
                builder: (controller) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // --- === button === ---
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 1,),
                          largeText(title: "Update New Image",fontWeight: FontWeight.w500),
                          InkWell(
                              onTap: (){
                                // controller.editFrontShirtImage!.delete();
                                // controller.editBackShirtImage!.delete();
                                // controller.editFrontShirtWeb.clear();
                                // controller.editBackShirtWeb.clear();
                                // controller.update();
                                Get.back();
                              },
                              child: Icon(CupertinoIcons.clear))
                        ],),
                      SizedBox(height: 60.h,),
                      // ------====--------------------------------------------------------------===-----
                      // ---------------   ==-= =--------= text form fields =--------= =-== -------------
                      // ------====--------------------------------------------------------------===-----
                      Form(
                        key: controller.editShirtImageFormKey,
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
                                hintText: "Shirt Name",
                                validator: FormValidatorConstant.commonValidator,
                                controller: controller.editedShirtNameController
                              ),
                            ),
                            // ----=-=--- shirt price form field ---=-=-----
                            SizedBox(width: 40.w,),
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
                                hintText: "Shirt Price",
                                validator: FormValidatorConstant.commonValidator,
                                controller: controller.editedShirtPriceController
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
                                      title: "Update Front Image",
                                      color: blackColor,
                                    ),
                                    SizedBox(height: 10,),
                                    // controller.backShirtImage == null ? Container() :
                                   controller.editFrontShirtImage != null ? Column(
                                     children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           InkWell(
                                           onTap: (){
                                             controller.editFrontShirtImage = null;
                                             controller.update();
                                           },
                                           child: Icon(CupertinoIcons.multiply)),
                                         ],
                                       ),
                                       Container(
                                           height: 150,
                                           width: 200.w,
                                           color: Colors.transparent,
                                           child: Image.memory(controller.editFrontShirtWeb)
                                       ),
                                     ],
                                   ) : Container(
                                        height: 150,
                                        width: 200.w,
                                        color: Colors.transparent,
                                        child: Image.network(frontImage!)
                                    ),
                                    SizedBox(height: 20,),
                                    commonButton(
                                        buttonName: "Update Image" ,
                                        onTap: (){
                                            controller.getEditFrontShirtImage();
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
                          //-=- ======== add front image button ======== -=-
                          SizedBox(width: 40.w,),
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
                                      title: "Update Back Image",
                                      color: blackColor,
                                    ),
                                    SizedBox(height: 10,),
                                    // controller.backShirtImage == null ? Container() :
                                    controller.editBackShirtImage != null ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                onTap: (){
                                                  controller.editBackShirtImage = null;
                                                  controller.update();
                                                },
                                                child: Icon(CupertinoIcons.multiply)),
                                          ],
                                        ),
                                        Container(
                                            height: 150,
                                            width: 200.w,
                                            color: Colors.transparent,
                                            child: Image.memory(controller.editBackShirtWeb)
                                        ),
                                      ],
                                    ) : Container(
                                        height: 150,
                                        width: 200.w,
                                        color: Colors.transparent,
                                        child: Image.network(backImage!)
                                    ),
                                    SizedBox(height: 20,),
                                    commonButton(
                                        buttonName: "Update Image" ,
                                        onTap: (){
                                          controller.getEditBackShirtImage();
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
                      controller.editShirtBool == true ? CircularProgressIndicator() :
                      commonButton(
                        buttonName: "Update",
                        onTap: (){
                            controller.updateShirtImages(id!);
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