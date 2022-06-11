import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/constants/form_validator_constant.dart';
import 'package:ifresh_originals_admin_panel/controller/home_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox orderWidget(context) {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              largeText(
                  title: "Order",
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          //-------------------------------------------------------------------------------------
          // -=-=  ----------=====-=-==    --=  heading table  =--    ==-=-=====----------- =-=-
          //-------------------------------------------------------------------------------------
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,

            border: TableBorder(
              bottom: BorderSide(color: Colors.black, width: 1),
              // borderRadius: BorderRadius.only(topRight: Radius.circular(60),topLeft: Radius.circular(15),),
              //   horizontalInside: BorderSide(color: Colors.red, width: 2),
            ),
            columnWidths: const {
              0: FlexColumnWidth(0.15),
              1: FlexColumnWidth(0.2),
              2: FlexColumnWidth(0.3),
              3: FlexColumnWidth(0.2),
              4: FlexColumnWidth(0.3),
              5: FlexColumnWidth(0.2),
              6: FlexColumnWidth(0.2),
              7: FlexColumnWidth(0.2),
              8: FlexColumnWidth(0.25),
            },
            children: [
              TableRow(
                  decoration:
                      BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                      child: Center(
                          child: commonText(
                              title: "S.NO",
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.black,fontSize: 10)
                      )),
                    )),
                    TableCell(
                        child: Center(
                            child: commonText(
                                   title: "User Name",
                                   textAlign: TextAlign.center,
                                   textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)

                    ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "User Email",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Phone No",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Delivery Time",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Paid Amount",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Order Date",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)
                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Delivery Status",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)
                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Action",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: redColor,fontSize: 12,fontWeight: FontWeight.w500)
                            ))),
                  ]),
            ],
          ),

          //-------------------------------------------------------------------------------------
          // -=-=  ----------=====-=-==    --=  table data   =--    ==-=-=====----------- =-=-
          //-------------------------------------------------------------------------------------
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,

            border: TableBorder(
              // bottom: BorderSide(color: Colors.black, width: 1),
              // borderRadius: BorderRadius.only(topRight: Radius.circular(60),topLeft: Radius.circular(15),),
              //   horizontalInside: BorderSide(color: Colors.red, width: 2),
            ),
            columnWidths: const {
              0: FlexColumnWidth(0.15),
              1: FlexColumnWidth(0.2),
              2: FlexColumnWidth(0.3),
              3: FlexColumnWidth(0.2),
              4: FlexColumnWidth(0.3),
              5: FlexColumnWidth(0.2),
              6: FlexColumnWidth(0.2),
              7: FlexColumnWidth(0.2),
              8: FlexColumnWidth(0.25),
            },
            children: [
              TableRow(
                  decoration:
                  BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                          child: Center(
                              child: commonText(
                                  title: "1",
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(color: Colors.black,fontSize: 10)
                              )),
                        )),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Muhammad ALi",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "ali@gmail.com",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "+9234929293",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "6-8 Delivery Days",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "\$120",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "12-jun-2022",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Pending",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 5
                          ),
                          child: InkWell(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return orderActionAlertDialogWidget();
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 23,
                              width: 24,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: commonText(title: "Action", textStyle: TextStyle(color: whiteColor, fontSize: 11) )),
                            ),
                          ),
                        )),
                  ]),
              TableRow(
                  decoration:
                  BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                          child: Center(
                              child: commonText(
                                  title: "2",
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(color: Colors.black,fontSize: 10)
                              )),
                        )),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Johnny Depp",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "johnnydepp121@gmail.com",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "+9234000093",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "6-8 Delivery Days",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "\$120",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "12-jun-2022",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Pending",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 5
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 23,
                              width: 24,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: commonText(title: "Action", textStyle: TextStyle(color: whiteColor, fontSize: 11) )),
                            ),
                          ),
                        )),
                  ]),
              TableRow(
                  decoration:
                  BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                          child: Center(
                              child: commonText(
                                  title: "3",
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(color: Colors.black,fontSize: 10)
                              )),
                        )),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Wasim Khan",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "wasimkhan220@gmail.com",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "+9234929293",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "3-6 Delivery Days",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "\$1920",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "22-jun-2022",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Pending",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 5
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 23,
                              width: 24,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: commonText(title: "Action", textStyle: TextStyle(color: whiteColor, fontSize: 11) )),
                            ),
                          ),
                        )),
                  ]),
              TableRow(
                  decoration:
                  BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                          child: Center(
                              child: commonText(
                                  title: "3",
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(color: Colors.black,fontSize: 10)
                              )),
                        )),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Imran Khan",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "imrankhan@gmail.com",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "+9232121293",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "8-13 Delivery Days",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "\$900",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "12-jun-2022",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Delivered",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 5
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 23,
                              width: 24,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: commonText(title: "Action", textStyle: TextStyle(color: whiteColor, fontSize: 11) )),
                            ),
                          ),
                        )),
                  ]),
              TableRow(
                  decoration:
                  BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                          child: Center(
                              child: commonText(
                                  title: "5",
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(color: Colors.black,fontSize: 10)
                              )),
                        )),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Muhammad ALi",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "ali@gmail.com",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "+9234929293",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "6-8 Delivery Days",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "\$740",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)

                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "12-jun-2022",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Center(
                            child: commonText(
                                title: "Pending",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: Colors.black,fontSize: 11)
                            ))),
                    TableCell(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 5
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 23,
                              width: 24,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: commonText(title: "Action", textStyle: TextStyle(color: whiteColor, fontSize: 11) )),
                            ),
                          ),
                        )),
                  ]),
            ],
          ),

          SizedBox(
            height: 40,
          )
        ],
      )),
    ),
  );
}

// ------====--------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Shirt Images Alert Dialog Widget =--------= =-== -------------
// ------====--------------------------------------------------------------===-----
AlertDialog orderActionAlertDialogWidget() {
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
            return  SingleChildScrollView(
              child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // --- === button === ---
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 1,),
                              largeText(title: "Order Details",fontWeight: FontWeight.w500),
                              InkWell(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Icon(CupertinoIcons.clear)),
                            ],
                          ),
                          SizedBox(height: 60.h,),
                          Container(
                            width: 600.w,
                          ),
                          //-------------=== User Personal Info ===-------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              commonText(
                                title: "User Personal Info...",
                                textStyle: TextStyle(
                                    color: redColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                )
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                              horizontal: 10
                            ),
                            child: Column(
                              children: [
                                rowDataWidget(
                                  title: "Username",
                                  value: "Muhammad Ali"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Email",
                                    value: "muhammadali@gmail.com"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Phone No",
                                    value: "+12232332323"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Address",
                                    value: "xyz"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "City",
                                    value: "xyz"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "State",
                                    value: "xyz"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Country",
                                    value: "xyz"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Zip Code",
                                    value: "xyz"
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 120.w),
                            child: Divider(height: 1,),
                          ),
                          SizedBox(height: 25,),

                          //-------------=== Delivery Status Info ===-------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              commonText(
                                  title: "Delivery Status Info...",
                                  textStyle: TextStyle(
                                      color: redColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15
                                  )
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 10
                            ),
                            child: Column(
                              children: [
                                rowDataWidget(
                                    title: "Status",
                                    value: "Delivery Pending",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    commonText(
                                        title: "Change Status",
                                        textStyle: TextStyle(
                                            fontSize: 11
                                        )
                                    ),
                                    commonButton(
                                      buttonName: "To Delivered",
                                      buttonColor: redColor,
                                      buttonHeight: 30,
                                      buttonWidth: 115,
                                      textSize: 13,
                                      textColor: whiteColor,
                                      onTap: (){}
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 120.w),
                            child: Divider(height: 1,),
                          ),
                          SizedBox(height: 25,),

                          //-------------=== Payment Info ===-------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              commonText(
                                  title: "Payment Info...",
                                  textStyle: TextStyle(
                                      color: redColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15
                                  )
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 10
                            ),
                            child: Column(
                              children: [
                                rowDataWidget(
                                  title: "Delivery Charge",
                                  value: "12",
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                  title: "Sub Total",
                                  value: "108",
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    commonText(
                                        title: "Total Paid Amount",
                                        textStyle: TextStyle(
                                            fontSize: 11
                                        )
                                    ),
                                    commonText(
                                        title: "120",
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                          fontWeight: FontWeight.w600

                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 120.w),
                            child: Divider(height: 1,),
                          ),
                          SizedBox(height: 25,),

                          //-------------=== Shirt Designs Ordered ===-------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              commonText(
                                  title: "Ordered Shirt Design...",
                                  textStyle: TextStyle(
                                      color: redColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15
                                  )
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 10
                            ),
                            child: Column(
                              children: [
                                rowDataWidget(
                                    title: "Size",
                                    value: "L"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Quantity",
                                    value: "10"
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Design Type",
                                    value: "Hoodie"
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    commonText(
                                        title: "Front Image",
                                        textStyle: TextStyle(
                                            fontSize: 11
                                        )
                                    ),
                                    Container(
                                      width: 250.w,
                                      height: 340.h,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                          image: AssetImage("assets/Hoodie0.png"),fit: BoxFit.contain
                                        )
                                      ),
                                    ),
                                    commonButton(
                                        buttonName: "Download",
                                        buttonColor: redColor,
                                        buttonHeight: 30,
                                        buttonWidth: 100,
                                        textSize: 13,
                                        textColor: whiteColor,
                                        onTap: (){}
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    commonText(
                                        title: "Back Image",
                                        textStyle: TextStyle(
                                            fontSize: 11
                                        )
                                    ),
                                    Container(
                                      width: 250.w,
                                      height: 340.h,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              image: AssetImage("assets/Hoodie0.png"),fit: BoxFit.contain
                                          )
                                      ),
                                    ),
                                    commonButton(
                                        buttonName: "Download",
                                        buttonColor: redColor,
                                        buttonHeight: 30,
                                        buttonWidth: 100,
                                        textSize: 13,
                                        textColor: whiteColor,
                                        onTap: (){}
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 120.w),
                            child: Divider(height: 1,),
                          ),
                          SizedBox(height: 25,),
                        ]),
            );

          })
  );
}

Row rowDataWidget({String? title,String? value}) {
  return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonText(
                                  title: title,
                                    textStyle: TextStyle(
                                        fontSize: 11
                                    )
                                ),
                                commonText(
                                  title: value,
                                  textStyle: TextStyle(
                                     fontSize: 13
                                  )
                                ),
                              ],
                            );
}
