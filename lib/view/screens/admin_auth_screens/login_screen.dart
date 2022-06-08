import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/constants/form_validator_constant.dart';
import 'package:ifresh_originals_admin_panel/controller/form_validation_controller.dart';
import 'package:ifresh_originals_admin_panel/controller/user_auth_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FormValidationController _formValidationController = Get.put(FormValidationController());
    final UserAuthController userAuthController = Get.put(UserAuthController());

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.sp),
          child: SingleChildScrollView(
              child: GetBuilder<UserAuthController>(builder: (controller) {
            return Container(
              height: 1.sh,
              width: 1.sw,
              color: Colors.transparent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        commonText(
                           title: "ADMIN PANEL",
                           textStyle: TextStyle(
                             color: blackColor.withOpacity(0.8),
                             fontSize: 35,
                             fontWeight: FontWeight.w500
                           ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 480,
                          width: 0.52.sh,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 45, horizontal: 100),
                            child: Column(
                              children: [
                                largeText(
                                  title: "Sign In To Your Account",
                                  fontWeight: FontWeight.w500
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                // ----=-=--- email form field ---=-=-----
                                Container(
                                  decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:  BorderRadius.circular(40.0),
                                      boxShadow: const [
                                        BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.4)
                                      ]),
                                  child: commonTextFormField(
                                    prefixIcon: Padding(
                                      padding:  EdgeInsets.only(right: 15,left: 24),
                                      child: Icon(CupertinoIcons.mail),
                                    ),
                                    hintText: "Email",
                                    validator: FormValidatorConstant.emailValidator,
                                    controller: _formValidationController.emailController
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                // ----=-=--- password form field ---=-=-----
                                Container(
                                  decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:  BorderRadius.circular(40.0),
                                      boxShadow: const [
                                        BoxShadow(color: Colors.black26, blurRadius: 6.0, spreadRadius: 0.4)
                                      ]),
                                  child: commonTextFormField(
                                      prefixIcon: Padding(
                                        padding:  EdgeInsets.only(right: 15,left: 24),
                                        child: Icon(CupertinoIcons.lock),
                                      ),
                                      hintText: "Password",
                                      validator: FormValidatorConstant.commonValidator,
                                      controller: _formValidationController.passwordController,
                                    obscureText: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    GetBuilder<FormValidationController>(
                                        builder: (controller) {
                                          return Checkbox(
                                              value: controller.isChecked,
                                              onChanged: (check)  {
                                                controller.isChecked = check!;
                                                controller.update();
                                              }
                                          );
                                        }
                                    ),
                                    smallText(
                                      title: "    Remember me", color: Color(0xff393F45),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                // ----=-=--- login button ---=-=-----
                                commonButton(
                                  buttonHeight: 45,
                                  buttonName: "Login",
                                  buttonWidth: 1.sw,
                                  onTap: (){},
                                  buttonColor: redColor,
                                  textColor: Colors.white
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            );
          })),
        )));
  }
}
