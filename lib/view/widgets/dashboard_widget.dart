import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/controller/home_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox dashboardWidget() {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          smallText(
            title: "Welcome",
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
          SizedBox(
            height: 10,
          ),
          commonText(
              title: "Hi, your analytics are all set",
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 10
              )
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 220,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // -=-== ------ image ------ -=-==
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                      // image: DecorationImage(image: AssetImage("assets/Asset 80.png",),),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image(
                        image: AssetImage("assets/Asset 80.png",), height: 50, width: 50, fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  commonText(
                      title: "289",
                      textStyle: TextStyle(
                          color: redColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  commonText(
                      title: "Shirt Images",
                      textStyle: TextStyle(
                          color: blackColor,
                          fontSize: 10,
                      )
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