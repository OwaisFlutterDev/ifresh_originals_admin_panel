import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox stickerWidget() {
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
                    fontWeight: FontWeight.w400
                ),
                commonButton(
                    buttonName: "Add New Sticker",
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
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 5,
              itemBuilder: (BuildContext ctx, index) {
                return stickerItemWidget(
                    image: "assets/Asset 240.png",
                    shirtName: "Lorem Ipsum",
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

Widget stickerItemWidget({String? image, String? shirtName, void Function()? onTap}) {
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

          // SizedBox(
          //   height: 40.h,
          // ),
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
                child: Center(child: Icon(Icons.edit,size: 25.r,)),
              ),
              SizedBox(width: 8,),
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
                child: Center(child: Icon(CupertinoIcons.delete,size: 25.r,color: redColor,)),
              )
            ],
          )


        ],
      ),
    ),
  );
}