import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/controller/home_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/dashboard_widget.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/home_scree_widget.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/order_widget.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/prices_widget.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/shirt_images.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/stickers_widget.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarWidget(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Row(
              children: [
                Stack(
                  children: [
                    NavigationRail(
                        backgroundColor: Colors.white,
                        selectedIndex: controller.selectedIndex,
                        labelType: NavigationRailLabelType.none,
                        extended: true,
                        onDestinationSelected: (index){
                          controller.selectedIndex = index;
                          controller.update();
                        },
                        selectedLabelTextStyle: TextStyle(color: redColor),
                        destinations: [
                          NavigationRailDestination(

                              icon: Image(image: AssetImage("assets/dashboard 1 copy-20.png"),
                                fit: BoxFit.scaleDown,width: 20,height: 20,
                                    color: controller.selectedIndex == 0 ? redColor : Colors.black,
                              ),
                              label: smallText(
                                  title: "Dashboard",
                                color: controller.selectedIndex == 0 ? redColor : Colors.black54,
                              )),
                          NavigationRailDestination(
                              icon: Image(image: AssetImage("assets/Asset 40.png"),
                                fit: BoxFit.scaleDown,width: 25,height: 25,
                                color: controller.selectedIndex == 1 ? redColor : Colors.black,
                              ),
                              label: smallText(
                                  title: "Shirt Image",
                                color: controller.selectedIndex == 1 ? redColor : Colors.black54,
                              )),
                          NavigationRailDestination(
                              icon: Image(image: AssetImage("assets/Asset 50.png"),
                                fit: BoxFit.scaleDown,width: 20,height: 20,
                                color: controller.selectedIndex == 2 ? redColor : Colors.black,
                              ),
                              label: smallText(
                                  title: "Stickers",
                                color: controller.selectedIndex == 2 ? redColor : Colors.black54,
                              )),
                          NavigationRailDestination(
                              icon: Image(image: AssetImage("assets/Asset 60.png"),
                                fit: BoxFit.scaleDown,width: 20,height: 20,
                                color: controller.selectedIndex == 3 ? redColor : Colors.black,
                              ),
                              label: smallText(
                                  title: "Orders",
                                color: controller.selectedIndex == 3 ? redColor : Colors.black54,
                              )),
                          NavigationRailDestination(
                              icon: Image(image: AssetImage("assets/Asset 70.png"),
                                fit: BoxFit.scaleDown,width: 20,height: 20,
                                color: controller.selectedIndex == 4 ? redColor : Colors.black,
                              ),
                              label: smallText(
                                  title: "Price",
                                color: controller.selectedIndex == 4 ? redColor : Colors.black54,
                              )),


                      ], ),
                    Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Icon(CupertinoIcons.square_arrow_left,color: Colors.black54),
                              SizedBox(width: 25,),
                              smallText(
                                title: "Logout",
                                color: Colors.black54,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                // VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                Expanded(
                  child: controller.selectedIndex == 0 ? dashboardWidget() :
                         controller.selectedIndex == 1 ? shirtWidget() :
                         controller.selectedIndex == 2 ? stickerWidget() :
                         controller.selectedIndex == 3 ? orderWidget() :
                         priceWidget()

                )
              ],
            );
          }
        ),
      ),
    );
  }
}