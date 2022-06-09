import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/controller/home_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

Widget shirtWidget() {
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
                    fontWeight: FontWeight.w400
                ),
                commonButton(
                  buttonName: "Add New Shirt",
                  buttonColor: redColor,
                  buttonWidth: 150,
                  buttonHeight: 60.h,
                  textColor: whiteColor,
                  textSize: 20.sp
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
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 5,
                itemBuilder: (BuildContext ctx, index) {
                  return shirtImageItemWidget(
                    image: "assets/Hoodie0.png",
                    shirtName: "Adult Log Sleeves",
                    onTap: (){}
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Widget shirtImageItemWidget({String? image, String? shirtName, void Function()? onTap}) {
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
                image: AssetImage(image!), height: 150.h, width: 90.w, fit: BoxFit.scaleDown,
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
              Container(
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

              Container(
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
              )
            ],
          )


        ],
      ),
    ),
  );
}