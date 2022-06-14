import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/controller/home_controller.dart';
import 'package:ifresh_originals_admin_panel/controller/orders_controller.dart';
import 'package:ifresh_originals_admin_panel/controller/shirt_images_controller.dart';
import 'package:ifresh_originals_admin_panel/controller/sticker_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox dashboardWidget() {
  final ShirtImagesController shirtImagesController = Get.put(ShirtImagesController());
  final StickerController stickerController = Get.put(StickerController());
  final OrderController orderController = Get.put(OrderController());
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
              title: "Welcome",
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
            SizedBox(
              height: 10,
            ),
            commonText(
                title: "Hi, your analytics are all set.",
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 13
                )
            ),
            SizedBox(
              height: 25,
            ),
            Obx(() =>  Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                dashboardItemWidget(
                    image: "assets/Asset 80.png",
                    title: "Shirt Images",
                    noOfShirt: "${shirtImagesController.shirtsDataList.length}",
                    onTap: (){}
                ),
                dashboardItemWidget(
                    image: "assets/Asset 90.png",
                    title: "Sticker",
                    noOfShirt: "${stickerController.stickerDataList.length}",
                    onTap: (){}
                ),
                dashboardItemWidget(
                    image: "assets/Asset 120.png",
                    title: "Today Orders",
                    noOfShirt:"${orderController.todayOrdersDataList.length}",
                    onTap: (){}
                ),
                dashboardItemWidget(
                    image: "assets/Asset 120.png",
                    title: "Total Orders",
                    noOfShirt: "${orderController.allOrderDataList.length}",
                    onTap: (){}
                ),

              ],
            ),),

            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    ),
  );
}

Widget dashboardItemWidget({String? image, String? noOfShirt, String? title, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
            height: 190,
            width: 210,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 15),
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
                    height: 25,
                  ),

                  commonText(
                      title: noOfShirt,
                      textStyle: TextStyle(
                          color: redColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  commonText(
                      title: title,
                      textStyle: TextStyle(
                          color: blackColor,
                          fontSize: 12,
                      )
                  ),

                ],
              ),
            ),
          ),
  );
}