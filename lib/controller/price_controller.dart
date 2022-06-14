import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceController extends GetxController{

  final GlobalKey<FormState> textPriceFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> stickerPriceFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> imageOnShirtPriceFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> deliveryPriceFormKey = GlobalKey<FormState>();

  late TextEditingController textPriceController, stickerPriceController,
      imageOnShirtPriceController, deliveryOnDemandPriceController, deliveryExpeditePriceController,
      deliveryStandardPriceController;

  @override
  void onInit() {
    super.onInit();

    textPriceController = TextEditingController();
    stickerPriceController = TextEditingController();

    imageOnShirtPriceController = TextEditingController();
    deliveryOnDemandPriceController = TextEditingController();

    deliveryExpeditePriceController = TextEditingController();
    deliveryStandardPriceController = TextEditingController();

  }


  String? id = "WgnBHn01s1w09e0SGB4p";
  int? textPrice;
  int? stickerPrice;
  int? imageOnShirtPrice;
  int? deliveryOnDemandPrice;
  int? deliveryExpeditePrice;
  int? deliveryStandardPrice;

  Future getAllPriceData() async{

    var collection = FirebaseFirestore.instance.collection('price');
    var querySnapshot = await collection.where('id', isEqualTo: id).get();

    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      textPrice = data["textPrice"];
      stickerPrice = data["stickerPrice"];
      imageOnShirtPrice = data["imageOnShirtPrice"];
      deliveryOnDemandPrice = data["deliveryOnDemandPrice"];
      deliveryExpeditePrice = data["deliveryExpeditePrice"];
      deliveryStandardPrice = data["deliveryStandardPrice"];
      update();

    }
  }
  // ==============================================================================
  // -------------- ===========    update text Price    ========== --------------
  //         =========================================================================

  bool textPriceBool = false;
  Future updateTextPrice() async{
    try {

      textPriceBool =true;
      update();
        int textPrice = int.parse(textPriceController.text);
        final docData = FirebaseFirestore.instance.collection('price').doc(id);
        await docData.update({
          "textPrice": textPrice,

        }).then((_) => print("Data is Updated "))
            .catchError((onError) => print(onError.toString()));
        textPriceBool = false;
        getAllPriceData();
        update();

        Get.back();
        Get.snackbar(
          "Update Text Price:",
          "Text Price Updated Successfully.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 5),
        );
    }
    catch (e) {
      print(e);
      textPriceBool = false;
      update();
    }
  }

  // ==============================================================================
  // -------------- ===========    update Sticker Price    ========== --------------
  //         =========================================================================

  bool stickerPriceBool = false;
  Future updateStickerPrice() async{
    try {

      stickerPriceBool =true;
      update();
      int stickerPriceE = int.parse(stickerPriceController.text);
      final docData = FirebaseFirestore.instance.collection('price').doc(id);
      await docData.update({
        "stickerPrice": stickerPriceE,

      }).then((_) => print("Data is Updated "))
          .catchError((onError) => print(onError.toString()));
      stickerPriceBool = false;
      getAllPriceData();
      update();

      Get.back();
      Get.snackbar(
        "Update Sticker Price:",
        "Sticker Price Updated Successfully.",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 5),
      );
    }
    catch (e) {
      print(e);
      stickerPriceBool = false;
      update();
    }
  }

  // ==============================================================================
  // -------------- ===========    update images on shirt Price    ========== --------------
  //         =========================================================================

  bool imageOnShirtPriceBool = false;
  Future updateImageOnShirtPrice() async{
    try {

      imageOnShirtPriceBool =true;
      update();
      int imagesPrices = int.parse(imageOnShirtPriceController.text);
      final docData = FirebaseFirestore.instance.collection('price').doc(id);
      await docData.update({
        "imageOnShirtPrice": imagesPrices,

      }).then((_) => print("Data is Updated "))
          .catchError((onError) => print(onError.toString()));
      imageOnShirtPriceBool = false;
      getAllPriceData();
      update();

      Get.back();
      Get.snackbar(
        "Update Image Price:",
        "Image On Shirt Price Updated Successfully.",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 5),
      );
    }
    catch (e) {
      print(e);
      imageOnShirtPriceBool = false;
      update();
    }
  }


  // ==============================================================================
  // -------------- ===========    update delivery Prices    ========== --------------
  //         =========================================================================

  bool deliveryPriceBool = false;
  Future updateDeliveryPrice() async{
    try {

      deliveryPriceBool =true;
      update();

      int onDemand = int.parse(deliveryOnDemandPriceController.text);
      int expedite = int.parse(deliveryExpeditePriceController.text);
      int standard = int.parse(deliveryStandardPriceController.text);


      final docData = FirebaseFirestore.instance.collection('price').doc(id);
      await docData.update({
        "deliveryOnDemandPrice": onDemand,
        "deliveryExpeditePrice": expedite,
        "deliveryStandardPrice": standard,

      }).then((_) => print("Data is Updated "))
          .catchError((onError) => print(onError.toString()));
      deliveryPriceBool = false;
      getAllPriceData();
      update();

      Get.back();
      Get.snackbar(
        "Update Delivery Price:",
        "Delivery Price Updated Successfully.",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 5),
      );
    }
    catch (e) {
      print(e);
      deliveryPriceBool = false;
      update();
    }
  }


}