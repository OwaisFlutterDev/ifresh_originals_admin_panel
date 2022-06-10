import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/model/shirt_images_model.dart';
import 'package:image_picker/image_picker.dart';

class ShirtImagesController extends GetxController{

  final GlobalKey<FormState> editShirtImageFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> shirtImageFormKey = GlobalKey<FormState>();


  late TextEditingController editedShirtNameController, editedShirtPriceController,
                             shirtNameController, shirtPriceController ;

  @override
  void onInit() {
    super.onInit();

    editedShirtNameController = TextEditingController();
    editedShirtPriceController = TextEditingController();

    shirtNameController = TextEditingController();
    shirtPriceController = TextEditingController();

  }


  // ------====---------------------------------------------------------------------===-----
  // ---------------   ==-= =--------= Add Shirt Images Function =---------= =-== ----------
  // ------====---------------------------------------------------------------------===-----

  File? frontShirtImage;
  //  ---------------- get the first shirt image from the gallery ---------------------
  void getFrontShirtImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);
    frontShirtImage = File(img!.path);
    update();
  }

  File? backShirtImage;
  //  ---------------- get the second shirt image from the gallery ---------------------
  void getBackShirtImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);
    backShirtImage = File(img!.path);
    update();
  }






  // ------====--------------------------------------------------------------===-----
  // ---------------   ==-= =--------= Edit Shirt Images Function =--------= =-== -------------
  // ------====--------------------------------------------------------------===-----




  File? editFrontShirtImage;
  //  ---------------- get the first shirt image from the gallery ---------------------
  void getEditFrontShirtImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);
    editFrontShirtImage = File(img!.path);
    update();
  }

  File? editBackShirtImage;
  //  ---------------- get the second shirt image from the gallery ---------------------
  void getEditBackShirtImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);
    editBackShirtImage = File(img!.path);
    update();
  }
}
