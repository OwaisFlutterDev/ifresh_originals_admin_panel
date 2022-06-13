import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/model/sticker_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class StickerController extends GetxController{

  final GlobalKey<FormState> editStickerImageFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> stickerImageFormKey = GlobalKey<FormState>();

  late TextEditingController editedStickerNameController,
      stickerNameController ;

  CollectionReference collectionReference = FirebaseFirestore.instance.collection("stickers");
  RxList<StickerModel> stickerDataList = RxList<StickerModel>([]);


  @override
  void onInit() {
    super.onInit();

    editedStickerNameController = TextEditingController();

    stickerNameController = TextEditingController();

    stickerDataList.bindStream(getStickerData());

  }


// ------====---------------------------------------------------------------------===-----
// ---------------   ==-= =--------= Add Sticker Images Function =---------= =-== ----------
// ------====---------------------------------------------------------------------===-----

  File? stickerImage;
  Uint8List stickerWeb = Uint8List(8);
  //  ---------------- get the first shirt image from the gallery ---------------------
  void getStickerImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    stickerImage = File(img!.path);
    if(img != null){
      var i = await img.readAsBytes();
      stickerWeb = i;
      update();
    }else{
      print("No Image Picked");
    }
    update();
  }

  bool addStickerBool = false;
  Future addShirtImages() async{
    try {
      addStickerBool =true;
      update();
      if (stickerImage != null ) {
        String stickerUrl;

        // ----------------- store and get front shirt image url ----------------

        String frontShirtImageString = basename(stickerImage!.path);

        Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            'shirts_images/$frontShirtImageString.png' );
        UploadTask uploadTask = firebaseStorageRef.putData(
          stickerWeb,
          SettableMetadata(contentType: 'image/png'),
        );

        await uploadTask.whenComplete(() => () { print("Upload Complete"); });

        stickerUrl = await firebaseStorageRef.getDownloadURL();

        final docData = FirebaseFirestore.instance.collection('stickers').doc();
        await docData.set({
          "id": docData.id,
          "stickerImage": stickerUrl,
          "stickerName": stickerNameController.text,

        }).then((_) => print("Data Of shirt Is Added to Firestore "))
            .catchError((onError) => print(onError.toString()));
        addStickerBool = false;
        stickerImage = null;
        update();

        Get.back();
        Get.snackbar(
          "Add Sticker Notification",
          "Sticker Data Added Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      } else {
        Get.snackbar("Add Sticker Data",
            "Please Select Any Icon Image",
            duration: Duration(seconds: 3));
        addStickerBool = false;
        update();
      }
    }
    catch (e) {
      print(e);
      addStickerBool = false;
      update();
    }
  }

  // ------====--------------------------------------------------------------===-----
  // ---------------   ==-= =--------= Get Sticker Images Data =--------= =-== -------------
  // ------====--------------------------------------------------------------===-----

  Stream<List<StickerModel>> getStickerData() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) =>
              StickerModel.fromDocumentSnapshot(item)).toList());





  // ------====--------------------------------------------------------------===-----
  // ---------------   ==-= =--------= Edit Shirt Images Function =--------= =-== -------------
  // ------====--------------------------------------------------------------===-----


  File? editStickerImage;
  Uint8List editStickerWeb = Uint8List(8);
  //  ---------------- get the first shirt image from the gallery ---------------------
  void getEditStickerImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    editStickerImage = File(img!.path);
    if(img != null){
      var i = await img.readAsBytes();
      editStickerWeb = i;
      update();
    }else{
      print("No Image Picked");
    }
    update();
  }

  bool editStickerBool = false;
  Future updateStickerData(String id) async{
    try {
      editStickerBool =true;
      update();
      if (editStickerImage == null) {
        print("1");
        final docData = FirebaseFirestore.instance.collection('stickers').doc(id);
        await docData.update({
          "stickerName": editedStickerNameController.text,

        }).then((_) => print("Data Of Sticker Is Updated "))
            .catchError((onError) => print(onError.toString()));
        editStickerBool = false;
        update();

        Get.back();
        Get.snackbar(
          "Update Sticker Data Notification",
          "Sticker Data Updated Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      }

      else{
        print("2");
        String backSIUrl;

        // ----------------- store and get back shirt image url ----------------

        String backShirtImageString = basename(editStickerImage!.path);

        Reference firebaseStorageReff = FirebaseStorage.instance.ref().child(
            'shirts_images/$backShirtImageString.png');
        UploadTask uploadTaskk = firebaseStorageReff.putData(
          editStickerWeb,
          SettableMetadata(contentType: 'image/png'),
        );

        await uploadTaskk.whenComplete(() => () { print("Upload Complete"); });

        backSIUrl = await firebaseStorageReff.getDownloadURL();

        final docData = FirebaseFirestore.instance.collection('shirts').doc(id);
        await docData.update({
          // "frontImage": frontSIUrl,
          "stickerImage": backSIUrl,
          "stickerName": editedStickerNameController.text,

        }).then((_) => print("Data Of shirt Is Updated "))
            .catchError((onError) => print(onError.toString()));
        editStickerBool = false;
        update();

        Get.back();
        Get.snackbar(
          "Update Sticker Data Notification",
          "Sticker Data Updated Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      }

    }
    catch (e) {
      print(e);
      editStickerBool = false;
      update();
    }
  }

}
