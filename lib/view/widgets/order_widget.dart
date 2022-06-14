// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/constants/form_validator_constant.dart';
import 'package:ifresh_originals_admin_panel/controller/home_controller.dart';
import 'package:ifresh_originals_admin_panel/controller/orders_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox orderWidget(context) {
  final OrderController orderController  = Get.put(OrderController());
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
          Obx(() =>
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: orderController.allOrderDataList.length,
                  itemBuilder: (context, index) {
                    return
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
                                          title: "${index +1} ",
                                          textAlign: TextAlign.center,
                                          textStyle: TextStyle(color: Colors.black,fontSize: 10)
                                      )),
                                )),
                            TableCell(
                                child: Center(
                                    child: commonText(
                                        title: orderController.allOrderDataList[index].username,
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(color: Colors.black,fontSize: 11)

                                    ))),
                            TableCell(
                                child: Center(
                                    child: commonText(
                                        title: orderController.allOrderDataList[index].email,
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(color: Colors.black,fontSize: 11)

                                    ))),
                            TableCell(
                                child: Center(
                                    child: commonText(
                                        title: orderController.allOrderDataList[index].phoneNo,
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(color: Colors.black,fontSize: 11)

                                    ))),
                            TableCell(
                                child: Center(
                                    child: commonText(
                                        title: orderController.allOrderDataList[index].deliveryTime,
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(color: Colors.black,fontSize: 11)

                                    ))),
                            TableCell(
                                child: Center(
                                    child: commonText(
                                        title: "\$  ${orderController.allOrderDataList[index].payedAmount}",
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(color: Colors.black,fontSize: 11)

                                    ))),
                            TableCell(
                                child: Center(
                                    child: commonText(
                                        title: "${
                                          orderController.allOrderDataList[index].todayDate
                                        }",
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(color: Colors.black,fontSize: 11)
                                    ))),
                            TableCell(
                                child: Center(
                                    child: commonText(
                                        title: orderController.allOrderDataList[index].status == true ? "Delivered" : "Pending",
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

                                      int? payAmnt = orderController.allOrderDataList[index].payedAmount;
                                      int? deliveryChrg = orderController.allOrderDataList[index].deliveryCharge;
                                      int? subTotal = payAmnt! - deliveryChrg!;

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return orderActionAlertDialogWidget(

                                              //-=-= user prsnl info =-=-=
                                              username: orderController.allOrderDataList[index].username,
                                              email: orderController.allOrderDataList[index].email,
                                              phoneNo: orderController.allOrderDataList[index].phoneNo,
                                              address: orderController.allOrderDataList[index].address,
                                              city: orderController.allOrderDataList[index].city,
                                              state: orderController.allOrderDataList[index].state,
                                              country: orderController.allOrderDataList[index].country,
                                              zipCode: orderController.allOrderDataList[index].zipCode,

                                                //-=-= delivery status info =-=-=
                                              status: orderController.allOrderDataList[index].status == true ? "Delivered" : "Delivery Pending",
                                              statusBool: orderController.allOrderDataList[index].status,
                                              id: orderController.allOrderDataList[index].id,
                                              // changeStatusOnTap: (){
                                              //
                                              // },

                                              //-=-= payment info =-=-=
                                              // String? deliveryCharge, String? subTotal,String? totalPaidAmount,
                                              deliveryCharge: orderController.allOrderDataList[index].deliveryCharge.toString(),
                                              subTotal: subTotal.toString(),
                                              totalPaidAmount: orderController.allOrderDataList[index].payedAmount.toString(),

                                                //-=-= ordered shirt design =-=-=
                                                // String? size, String? quantity, String? designType, String? frontImage,String? backImage,
                                                // void Function()? downloadFrontImage, void Function()? downloadBackImage,
                                              orderedShirtDesignWidget:   Container(
                                                height: 500,
                                                width: 0.43.sw,
                                                color: Colors.transparent,
                                                child: ListView.builder(
                                                                          shrinkWrap: true,
                                                                          physics: ScrollPhysics(),
                                                                          itemCount: orderController.allOrderDataList[index].productList!.length,
                                                                          itemBuilder: (context, ind) {
                                                                          return Column(
                                                                            children: [
                                                                              // //-------------=== Shirt Designs Ordered ===-------------

                                                                              Padding(
                                                                                padding:  EdgeInsets.symmetric(
                                                                                    horizontal: 10
                                                                                ),
                                                                                child: Column(
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        commonText(
                                                                                          title: "Design No: ${ind + 1}",
                                                                                          textStyle: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,)
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    rowDataWidget(
                                                                                        title: "Size",
                                                                                        value: orderController.allOrderDataList[index].productList![ind].selectedSize
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5,
                                                                                    ),
                                                                                    rowDataWidget(
                                                                                        title: "Quantity",
                                                                                        value: orderController.allOrderDataList[index].productList![ind].selectedQuantity.toString()
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5,
                                                                                    ),
                                                                                    rowDataWidget(
                                                                                        title: "Design Type",
                                                                                        value: orderController.allOrderDataList[index].productList![ind].designType
                                                                                    ),
                                                                                    // -=-=    -------- front image and download button ------ ==-=-=-
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
                                                                                          height: 300.h,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.transparent,
                                                                                            image: DecorationImage(
                                                                                              image: NetworkImage(orderController.allOrderDataList[index].productList![ind].frontImage!),
                                                                                                fit: BoxFit.contain
                                                                                            ),
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
                                                                                    // -=-=    -------- back  image and download button ------ ==-=-=-
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
                                                                                          height: 300.h,
                                                                                          decoration: BoxDecoration(
                                                                                              color: Colors.transparent,
                                                                                              image: DecorationImage(
                                                                                                  image: NetworkImage(orderController.allOrderDataList[index].productList![ind].backImage!),fit: BoxFit.contain
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
                                                                                    SizedBox(height: 15,),
                                                                                    Padding(
                                                                                      padding:  EdgeInsets.symmetric(horizontal: 140.w),
                                                                                      child: Divider(height: 1,color: Colors.black54,thickness: 0.5,),
                                                                                    ),
                                                                                    SizedBox(height: 20,),
                                                                                  ],
                                                                                ),
                                                                              ),


                                                                            ],
                                                                          );

                                                                          }),
                                              ),


                                            );
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

                    ],
                   );
                }   )

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
AlertDialog orderActionAlertDialogWidget({
      //-=-= user prsnl info =-=-=
      String? username, String? email, String? phoneNo, String? address, String? city,
  String? state, String? country, String? zipCode,
  //-=-= delivery status info =-=-=
  String? status,
  // void Function()? changeStatusOnTap,
  bool? statusBool, String? id,
  //-=-= payment info =-=-=
  String? deliveryCharge, String? subTotal,String? totalPaidAmount,
  //-=-= ordered shirt design =-=-=
  required Widget orderedShirtDesignWidget

}) {
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
                                  value: username
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Email",
                                    value: email
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Phone No",
                                    value: phoneNo
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Address",
                                    value: address
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "City",
                                    value: city
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "State",
                                    value: state
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Country",
                                    value: country
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                    title: "Zip Code",
                                    value: zipCode
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
                                    value: status,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GetBuilder<OrderController>(
                                  init: OrderController(),
                                  builder: (controller) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            title: "Change Status",
                                            textStyle: TextStyle(
                                                fontSize: 11
                                            )
                                        ),
                                        statusBool == true ? controller.updateToPendingBool == true ? CircularProgressIndicator() : commonButton(
                                          buttonName: "To Pending",
                                          buttonColor: Colors.blueAccent,
                                          buttonHeight: 30,
                                          buttonWidth: 115,
                                          textSize: 13,
                                          textColor: whiteColor,
                                          onTap: (){
                                             controller.updateToPending(id);
                                          }
                                        ) : controller.updateToDeliveredBool == true ? CircularProgressIndicator() : commonButton(
                                            buttonName: "To Delivered",
                                            buttonColor: redColor,
                                            buttonHeight: 30,
                                            buttonWidth: 115,
                                            textSize: 13,
                                            textColor: whiteColor,
                                            onTap: (){
                                                  controller.updateToDelivered(id);
                                            }
                                        )
                                      ],
                                    );
                                  }
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
                                  value: deliveryCharge
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                rowDataWidget(
                                  title: "Sub Total",
                                  value: subTotal
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
                                        title: totalPaidAmount,
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
                          SizedBox(height: 10,),
                          orderedShirtDesignWidget,
                          // //-------------=== Shirt Designs Ordered ===-------------

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     commonText(
                          //         title: "Ordered Shirt Design...",
                          //         textStyle: TextStyle(
                          //             color: redColor,
                          //             fontWeight: FontWeight.w500,
                          //             fontSize: 15
                          //         )
                          //     )
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Padding(
                          //   padding:  EdgeInsets.symmetric(
                          //       horizontal: 10
                          //   ),
                          //   child: Column(
                          //     children: [
                          //       rowDataWidget(
                          //           title: "Size",
                          //           value: size
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       rowDataWidget(
                          //           title: "Quantity",
                          //           value: quantity
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       rowDataWidget(
                          //           title: "Design Type",
                          //           value: designType
                          //       ),
                          //
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           commonText(
                          //               title: "Front Image",
                          //               textStyle: TextStyle(
                          //                   fontSize: 11
                          //               )
                          //           ),
                          //           Container(
                          //             width: 250.w,
                          //             height: 340.h,
                          //             decoration: BoxDecoration(
                          //               color: Colors.transparent,
                          //               image: DecorationImage(
                          //                 image: NetworkImage(frontImage!),fit: BoxFit.contain
                          //               )
                          //             ),
                          //           ),
                          //           commonButton(
                          //               buttonName: "Download",
                          //               buttonColor: redColor,
                          //               buttonHeight: 30,
                          //               buttonWidth: 100,
                          //               textSize: 13,
                          //               textColor: whiteColor,
                          //               onTap: downloadFrontImage
                          //           )
                          //         ],
                          //       ),
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           commonText(
                          //               title: "Back Image",
                          //               textStyle: TextStyle(
                          //                   fontSize: 11
                          //               )
                          //           ),
                          //           Container(
                          //             width: 250.w,
                          //             height: 340.h,
                          //             decoration: BoxDecoration(
                          //                 color: Colors.transparent,
                          //                 image: DecorationImage(
                          //                     image: NetworkImage(backImage!),fit: BoxFit.contain
                          //                 )
                          //             ),
                          //           ),
                          //           commonButton(
                          //               buttonName: "Download",
                          //               buttonColor: redColor,
                          //               buttonHeight: 30,
                          //               buttonWidth: 100,
                          //               textSize: 13,
                          //               textColor: whiteColor,
                          //               onTap: downloadBackImage
                          //           )
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                          //
                          // SizedBox(height: 20,),
                          // Padding(
                          //   padding:  EdgeInsets.symmetric(horizontal: 120.w),
                          //   child: Divider(height: 1,),
                          // ),
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
