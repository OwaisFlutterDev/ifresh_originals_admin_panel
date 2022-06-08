import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormValidationController extends GetxController{

  //   ----- ========== Global Key ========== -----
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();


  //   ----- ========== Text Editing Controller ========== -----
  late  TextEditingController passwordController, emailController;


  // --- ========= bool ======== ---
  bool isChecked = false;


  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();

  }



  void clearTextField(){
    emailController.clear();
    passwordController.clear();
  }

}