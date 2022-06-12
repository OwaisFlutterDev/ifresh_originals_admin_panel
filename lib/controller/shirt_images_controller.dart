import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/model/shirt_images_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

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
  Uint8List frontShirtWeb = Uint8List(8);
  Uint8List backShirtWeb = Uint8List(8);

  //  ---------------- get the first shirt image from the gallery ---------------------
  void getFrontShirtImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    frontShirtImage = File(img!.path);
    if(img != null){
       var i = await img.readAsBytes();
       frontShirtWeb = i;
       update();
    }else{
      print("No Image Picked");
    }
    update();
  }

  File? backShirtImage;
  //  ---------------- get the second shirt image from the gallery ---------------------
  void getBackShirtImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    backShirtImage = File(img!.path);
    if(img != null){
      var i = await img.readAsBytes();
      backShirtWeb = i;
      update();
    }else{
      print("No Image Picked");
    }
    update();
  }



  Future addShirtImages() async{
    try {
      if (frontShirtImage != null && backShirtImage != null) {
        String frontSIUrl;
        String backSIUrl;

        // ----------------- store and get front shirt image url ----------------
        String frontShirtImageString = basename(frontShirtImage!.path);

        Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            'shirts_images/$frontShirtImageString');
        UploadTask uploadTask = firebaseStorageRef.putFile(frontShirtImage!);

        await uploadTask.whenComplete(() => () { print("Upload Complete"); });

        frontSIUrl = await firebaseStorageRef.getDownloadURL();
        // String? fireStoreUserImage = userProfileModel.image;

        // ----------------- store and get back shirt image url ----------------
        String backShirtImageString = basename(backShirtImage!.path);

        Reference firebaseStorageReff = FirebaseStorage.instance.ref().child(
            'shirts_images/$backShirtImageString');
        UploadTask uploadTaskk = firebaseStorageReff.putFile(backShirtImage!);

        await uploadTaskk.whenComplete(() => () { print("Upload Complete"); });

        backSIUrl = await firebaseStorageReff.getDownloadURL();

        final docData = FirebaseFirestore.instance.collection('shirts').doc();
        await docData.set({
          "id": docData.id,
          "frontImage": frontSIUrl,
          "backImage": backSIUrl,
          "shirtName": shirtNameController.text,
          "shirtPrice": shirtPriceController.text,

        }).then((_) => print("Data Of shirt Is Added to Firestore "))
            .catchError((onError) => print(onError.toString()));
      }
    }
      catch (e) {
      print(e);
    }
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
