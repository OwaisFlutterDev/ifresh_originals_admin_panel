import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/constants/form_validator_constant.dart';
import 'package:ifresh_originals_admin_panel/controller/shirt_images_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

Widget shirtWidget(context) {
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
                  buttonHeight: 60.h,
                  textColor: whiteColor,
                  textSize: 20.sp,
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return addShirtImagesAlertDialogWidget();
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
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 5,
                itemBuilder: (BuildContext ctx, index) {
                  return shirtImageItemWidget(
                    image: "assets/Hoodie0.png",
                    shirtName: "Adult Log Sleeves",
                    deleteButton: (){},
                    editButton: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return editShirtImagesAlertDialogWidget();
                          });
                    }
                );
              },
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
            width: 120.w,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              // image: DecorationImage(image: AssetImage("assets/Asset 80.png",),),
            ),
            child: Padding(
              padding:  EdgeInsets.all(15.r),
              child: Image(
                image: AssetImage(image!), height: 170.h, width: 90.w, fit: BoxFit.scaleDown,
              ),
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
                  fontSize: 20.sp,
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
                   height: 45.h,
                    width: 45.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 4.0, spreadRadius: 0.3)
                      ]
                  ),
                  child: Center(child: Icon(Icons.edit,size: 30.r,)),
                ),
              ),

              InkWell(
                onTap: deleteButton,
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
                  child: Center(child: Icon(CupertinoIcons.delete,size: 30.r,color: redColor,)),
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
                            commonButton(
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
AlertDialog editShirtImagesAlertDialogWidget() {
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
                                controller: controller.shirtPriceController
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