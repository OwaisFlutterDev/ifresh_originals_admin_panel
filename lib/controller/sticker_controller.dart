import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StickerController extends GetxController{

  final GlobalKey<FormState> editStickerImageFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> stickerImageFormKey = GlobalKey<FormState>();

  late TextEditingController editedStickerNameController,
      stickerNameController ;

  @override
  void onInit() {
    super.onInit();

    editedStickerNameController = TextEditingController();

    stickerNameController = TextEditingController();

  }


// ------====---------------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Sticker Images Function =---------= =-== ----------
// ------====---------------------------------------------------------------------===-----

  File? stickerImage;
  //  ---------------- get the first shirt image from the gallery ---------------------
  void getStickerImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);
    stickerImage = File(img!.path);
    update();
  }


  // ------====--------------------------------------------------------------===-----
  // ---------------   ==-= =--------= Edit Shirt Images Function =--------= =-== -------------
  // ------====--------------------------------------------------------------===-----


  File? editStickerImage;
  //  ---------------- get the first shirt image from the gallery ---------------------
  void getEditStickerImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);
    editStickerImage = File(img!.path);
    update();
  }


}
