import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ifresh_originals_admin_panel/controller/form_validation_controller.dart';
import 'package:ifresh_originals_admin_panel/view/screens/home_screens/home_screen.dart';

class UserAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // final UserProfileController _userProfileController = Get.put(UserProfileController());
  //   // _userProfileController.getUserData();
  // }

  late Box box1 ;

  @override
  void onInit(){
    super.onInit();

    // userDataList.bindStream(getAllUserData());
    createBox();

  }



  void createBox() async {
    box1 = await Hive.openBox("loginData");
    getData();
  }

  void getData() async {
    FormValidationController formValidationController = Get.put(FormValidationController());
    if(box1.get('email') != null){
      formValidationController.emailController.text = box1.get("email");
      update();
    }
    else {
      print("Null email");
    }
    if(box1.get('password') != null) {
      formValidationController.passwordController.text = box1.get("password");
      update();
    }
    else {
      print("Null password");
    }
  }

  // ==============================================================================
  // -------------- ===========    Sign up through email & password used for (Employee)  ========== --------------
  //         =========================================================================

  Future createAccount() async {
    final FormValidationController _formValidationController = Get.put(FormValidationController());

    try {
      User? firebaseUser = (await _auth.createUserWithEmailAndPassword(
          email: _formValidationController.emailController.text.trim(),
          password: _formValidationController.passwordController.text.trim())).user;


      if (firebaseUser != null) {

        _formValidationController.clearTextField();
        // Get.back();

        CollectionReference user = FirebaseFirestore.instance.collection('admin');
        user.doc(firebaseUser.uid).set({
          "uid": firebaseUser.uid,
          "email": _formValidationController.emailController.text,

        }).then((_) => print("Data Of User Is Added to Firestore "))
            .catchError((onError) => print(onError.toString()));

        Get.snackbar(
          "Create Account Notification",
          "You Created Account Successfully :) ",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
        // return _user;
      } else {
        Get.snackbar(
          "Create Account Notification",
          "Account creation field!  please check your email or password",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Create Account Notification",
          "The password provided is too weak.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Create Account Notification",
          "The Account Already Exists For That Email.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      }
    } catch (error) {
      print(error);
      // Get.snackbar(
      //   "Add Employee Notification",
      //   error.toString(),
      //   snackPosition: SnackPosition.TOP,
      //   duration: Duration(seconds: 5),
      // );
      return null;
    }
  }

  // ==============================================================================
// -------------- ===========    Sign In through email and password As (Admin)    ========== --------------
//         =========================================================================
  bool loginBool = false;

  Future signInThroughEmailAndPassword() async {
    loginBool = true;
    update();
    final FormValidationController formValidationController = Get.put(FormValidationController());

    try {
      User? user = (await _auth.signInWithEmailAndPassword(
          email: formValidationController.emailController.text.trim(),
          password: formValidationController.passwordController.text.trim())).user;

      var collection = FirebaseFirestore.instance.collection('admin');
      var querySnapshot = await collection.where('email', isEqualTo: user!.email).get();

      var email = "";

      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();
        email = data["email"];
      }

      if (email.isNotEmpty) {
        loginBool = false;
        // --==============================================================--
        // --=====-=-= give value to remember the user credentials --=====-=-=
        // --==============================================================--
        if(formValidationController.isChecked) {
          box1.put("email", formValidationController.emailController.text);
          box1.put("password", formValidationController.passwordController.text);
        }
        update();
        Get.to(() => HomeScreen());

        Get.snackbar(
          "SignIn Notification",
          "Welcome To Dashboard.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
        formValidationController.clearTextField();

      } else {

        Get.snackbar(
          "Sign In Notification",
          "No user found for that email...",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
        loginBool = false;
        update();
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

        Get.snackbar(
          "Sign In Notification",
          "No user found for that email.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
        loginBool = false;
        update();
      } else if (e.code == 'wrong-password') {

        Get.snackbar(
          "Sign In Notification",
          "Wrong password provided for that user.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
        loginBool = false;
        update();
      }
    } catch (error) {
      loginBool = false;
      update();
      print(error);
      return null;
    }
  }

// ==============================================================================
// -------------- ===========    Forget Password Method    ========== ----------------------
//         =========================================================================

  Future resetPasswordRequest() async {
    final FormValidationController formValidationController = Get.put(FormValidationController());

    try {
      await _auth.sendPasswordResetEmail(email: formValidationController.emailController.text.trim());
      Get.snackbar("Reset Password Screen",
          "The mail is send to ${formValidationController.emailController.text.trim()} please reset the Password",
          duration: Duration(seconds: 5));

      formValidationController.clearTextField();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Reset Password Notification",
          "No user found for that email.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      } else {
        return null;
      }
    } catch (error) {
      // Get.snackbar("Reset Password Screen", error.toString(),
      //     duration: Duration(seconds: 5));
      print(error);
    }
  }


// ==============================================================================
  // -------------- ===========    Sign out method   ========== --------------
  //         =========================================================================

  void logOut() async {
    FirebaseAuth.instance.signOut();
    // Get.off(() => LoginScreen());
    Get.back();
  }

}