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
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("shirts");
  RxList<ShirtImageModel> shirtsDataList = RxList<ShirtImageModel>([]);

  @override
  void onInit() {
    super.onInit();

    editedShirtNameController = TextEditingController();
    editedShirtPriceController = TextEditingController();

    shirtNameController = TextEditingController();
    shirtPriceController = TextEditingController();

    shirtsDataList.bindStream(getShirtData());

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


  bool addShirtBool = false;
  Future addShirtImages() async{
    try {
      addShirtBool =true;
      update();
      if (frontShirtImage != null && backShirtImage != null) {
        String frontSIUrl;
        String backSIUrl;

        // ----------------- store and get front shirt image url ----------------

        String frontShirtImageString = basename(frontShirtImage!.path);

        Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            'shirts_images/$frontShirtImageString.png' );
        UploadTask uploadTask = firebaseStorageRef.putData(
           frontShirtWeb,
          SettableMetadata(contentType: 'image/png'),
        );

        await uploadTask.whenComplete(() => () { print("Upload Complete"); });

        frontSIUrl = await firebaseStorageRef.getDownloadURL();
        // String? fireStoreUserImage = userProfileModel.image;

        // ----------------- store and get back shirt image url ----------------

        String backShirtImageString = basename(backShirtImage!.path);

        Reference firebaseStorageReff = FirebaseStorage.instance.ref().child(
            'shirts_images/$backShirtImageString.png');
        UploadTask uploadTaskk = firebaseStorageReff.putData(
          backShirtWeb,
          SettableMetadata(contentType: 'image/png'),
        );

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
        addShirtBool = false;
        frontShirtImage = null;
        backShirtImage = null;
        update();

        Get.back();
        Get.snackbar(
          "Add Shirt Notification",
          "Shirt Data Added Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      }
    }
      catch (e) {
      print(e);
      addShirtBool = false;
      update();
    }
  }

  // ------====--------------------------------------------------------------===-----
  // ---------------   ==-= =--------= Get Shirt Images Data =--------= =-== -------------
  // ------====--------------------------------------------------------------===-----

  Stream<List<ShirtImageModel>> getShirtData() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) =>
              ShirtImageModel.fromDocumentSnapshot(item)).toList());


  // ------====--------------------------------------------------------------===-----
  // ---------------   ==-= =--------= Edit Shirt Images Function =--------= =-== -------------
  // ------====--------------------------------------------------------------===-----


  File? editFrontShirtImage;
  File? editBackShirtImage;

  Uint8List editFrontShirtWeb = Uint8List(8);
  Uint8List editBackShirtWeb = Uint8List(8);


  //  ---------------- get the first shirt image from the gallery ---------------------
  void getEditFrontShirtImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    editFrontShirtImage = File(img!.path);
    if(img != null){
      var i = await img.readAsBytes();
      editFrontShirtWeb = i;
      update();
    }else{
      print("No Image Picked");
    }
    update();
  }

  //  ---------------- get the second shirt image from the gallery ---------------------
  void getEditBackShirtImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    editBackShirtImage = File(img!.path);
    if(img != null){
      var i = await img.readAsBytes();
      editBackShirtWeb = i;
      update();
    }else{
      print("No Image Picked");
    }
    update();
  }


  bool editShirtBool = false;
  Future updateShirtImages(String id) async{
    try {
      editShirtBool =true;
      update();
      if (editFrontShirtImage == null && editBackShirtImage == null) {
        print("1");
        final docData = FirebaseFirestore.instance.collection('shirts').doc(id);
        await docData.update({
          "shirtName": editedShirtNameController.text,
          "shirtPrice": editedShirtPriceController.text,

        }).then((_) => print("Data Of shirt Is Updated "))
            .catchError((onError) => print(onError.toString()));
        editShirtBool = false;
        update();

        Get.back();
        Get.snackbar(
          "Update Shirt Data Notification",
          "Shirt Data Updated Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      }
      else if(editFrontShirtImage != null && editBackShirtImage != null) {
        print("2");
        String frontSIUrl;
        String backSIUrl;

        // ----------------- store and get front shirt image url ----------------

        String frontShirtImageString = basename(editFrontShirtImage!.path);

        Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            'shirts_images/$frontShirtImageString.png' );
        UploadTask uploadTask = firebaseStorageRef.putData(
          editFrontShirtWeb,
          SettableMetadata(contentType: 'image/png'),
        );

        await uploadTask.whenComplete(() => () { print("Upload Complete"); });

        frontSIUrl = await firebaseStorageRef.getDownloadURL();
        // String? fireStoreUserImage = userProfileModel.image;

        // ----------------- store and get back shirt image url ----------------

        String backShirtImageString = basename(editBackShirtImage!.path);

        Reference firebaseStorageReff = FirebaseStorage.instance.ref().child(
            'shirts_images/$backShirtImageString.png');
        UploadTask uploadTaskk = firebaseStorageReff.putData(
          editBackShirtWeb,
          SettableMetadata(contentType: 'image/png'),
        );

        await uploadTaskk.whenComplete(() => () { print("Upload Complete"); });

        backSIUrl = await firebaseStorageReff.getDownloadURL();


        final docData = FirebaseFirestore.instance.collection('shirts').doc(id);
        await docData.update({
          "frontImage": frontSIUrl,
          "backImage": backSIUrl,
          "shirtName": editedShirtNameController.text,
          "shirtPrice": editedShirtPriceController.text,

        }).then((_) => print("Data Of shirt Is Updated "))
            .catchError((onError) => print(onError.toString()));
        editShirtBool = false;
        update();

        Get.back();
        Get.snackbar(
          "Update Shirt Data Notification",
          "Shirt Data Updated Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );

      }
      else if(editFrontShirtImage != null) {
        print("3");
        String frontSIUrl;

        // ----------------- store and get front shirt image url ----------------

        String frontShirtImageString = basename(editFrontShirtImage!.path);

        Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            'shirts_images/$frontShirtImageString.png' );
        UploadTask uploadTask = firebaseStorageRef.putData(
          editFrontShirtWeb,
          SettableMetadata(contentType: 'image/png'),
        );

        await uploadTask.whenComplete(() => () { print("Upload Complete"); });

        frontSIUrl = await firebaseStorageRef.getDownloadURL();

        final docData = FirebaseFirestore.instance.collection('shirts').doc(id);
        await docData.update({
          "frontImage": frontSIUrl,
          //   "backImage": backSIUrl,
          "shirtName": editedShirtNameController.text,
          "shirtPrice": editedShirtPriceController.text,

        }).then((_) => print("Data Of shirt Is Updated "))
            .catchError((onError) => print(onError.toString()));
        editShirtBool = false;
        update();

        Get.back();
        Get.snackbar(
          "Update Shirt Data Notification",
          "Shirt Data Updated Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );

      }
      else{
        print("4");
        String backSIUrl;

        // ----------------- store and get back shirt image url ----------------

        String backShirtImageString = basename(editBackShirtImage!.path);

        Reference firebaseStorageReff = FirebaseStorage.instance.ref().child(
            'shirts_images/$backShirtImageString.png');
        UploadTask uploadTaskk = firebaseStorageReff.putData(
          editBackShirtWeb,
          SettableMetadata(contentType: 'image/png'),
        );

        await uploadTaskk.whenComplete(() => () { print("Upload Complete"); });

        backSIUrl = await firebaseStorageReff.getDownloadURL();

        final docData = FirebaseFirestore.instance.collection('shirts').doc(id);
        await docData.update({
          // "frontImage": frontSIUrl,
          "backImage": backSIUrl,
          "shirtName": editedShirtNameController.text,
          "shirtPrice": editedShirtPriceController.text,

        }).then((_) => print("Data Of shirt Is Updated "))
            .catchError((onError) => print(onError.toString()));
        editShirtBool = false;

        update();

        Get.back();
        Get.snackbar(
          "Update Shirt Data Notification",
          "Shirt Data Updated Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
      }

    }
    catch (e) {
      print(e);
      editShirtBool = false;
      update();
    }
  }


  // ==============================================================================
  // -------------- ===========    Delete Shirts    ========== --------------
  //         =========================================================================

  bool deleteBool = false;
  Future deleteShirt(String id) async{
    deleteBool = true;
    update();
    successMsg(){
      Get.back();
      Get.snackbar(
        "Delete Shirts Notification",
        "The Shirts Data is Deleted Successfully: ",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 4),
      );
    }

    try {

      final collection = FirebaseFirestore.instance.collection('shirts');
      await collection
          .doc(id) // <-- Doc ID to be deleted.
          .delete() // <-- Delete
          .then((_) => successMsg())
          .catchError((error) => print('Delete failed: $error'));

      deleteBool = false;
      update();
    }
    catch (error){
      // Get.snackbar(
      //   "Delete Stickers Notification",
      //   "Check Your Internet Connection",
      //   snackPosition: SnackPosition.TOP,
      //   duration: Duration(seconds: 3),
      // );
      deleteBool = false;
      update();
    }
  }

}
