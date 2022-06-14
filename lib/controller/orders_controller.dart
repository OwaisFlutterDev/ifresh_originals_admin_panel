import 'dart:typed_data';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/model/order_model.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class OrderController extends GetxController{

  RxList<OrderModel> allOrderDataList = RxList<OrderModel>([]);
  RxList<OrderModel> todayOrdersDataList = RxList<OrderModel>([]);
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("OrderDetails");


  @override
  void onInit(){
    super.onInit();

    allOrderDataList.bindStream(getAllOrderData());
    todayOrdersDataList.bindStream(getAllOrderData());

  }

  // ==============================================================================
  // -------------- ===========    Get All Order Data    ========== --------------
  //         ======================================================================

  Stream<List<OrderModel>> getAllOrderData() =>
      collectionReference.orderBy("currentDate", descending: true).snapshots()
          .map((query) =>
          query.docs.map((item) =>
              OrderModel.fromDocumentSnapshot(item)).toList());

  // ==============================================================================
  // -------------- ===========    Get All Order Data    ========== --------------
  //         ======================================================================

  Stream<List<OrderModel>> todayOrderData() =>
      collectionReference.where("todayDate", isEqualTo: DateFormat("dd-MM-yyyy").format(DateTime.now()),).snapshots()
          .map((query) =>
          query.docs.map((item) =>
              OrderModel.fromDocumentSnapshot(item)).toList());

// ==============================================================================
// -------------- ===========    update to Delivered the Status    ========== --------------
// ==============================================================================

  bool updateToDeliveredBool = false;
  Future updateToDelivered(String? id) async{
    try {

      updateToDeliveredBool =true;
      update();

      final docData = FirebaseFirestore.instance.collection('OrderDetails').doc(id);
      await docData.update({
        "status": true,

      }).then((_) => print("Data is Updated "))
          .catchError((onError) => print(onError.toString()));
      updateToDeliveredBool = false;
      update();

      Get.back();
      Get.snackbar(
        "Update Order Detail:",
        "Updated Successfully.",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 5),
      );
    }
    catch (e) {
      print(e);
      updateToDeliveredBool = false;
      update();
    }
  }

// ==============================================================================
// -------------- ===========    update to Pending the Status    ========== --------------
// ==============================================================================

  bool updateToPendingBool = false;
  Future updateToPending(String? id) async{
    try {

      updateToPendingBool =true;
      update();

      final docData = FirebaseFirestore.instance.collection('OrderDetails').doc(id);
      await docData.update({
        "status": false,

      }).then((_) => print("Data is Updated "))
          .catchError((onError) => print(onError.toString()));
      updateToPendingBool = false;
      update();

      Get.back();
      Get.snackbar(
        "Update Order Detail:",
        "Updated Successfully.",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 5),
      );
    }
    catch (e) {
      print(e);
      updateToPendingBool = false;
      update();
    }
  }


// ==============================================================================
// -------------- ===========    download shirt images    ========== -----------
// ==============================================================================

  final WebImageDownloader _webImageDownloader = WebImageDownloader();
   // static const _url = "https://firebasestorage.googleapis.com/v0/b/ifresh-originals.appspot.com/o/shirt_design_images%2FJtzigZPu54SmNZkyTy9dcCZOLjK22022-06-14%2014%3A49%3A26.117215.png?alt=media&token=b1251b2e-27d7-4113-90e4-2d7227b1974d";

  Future<void> downloadShirtImage(String url) async {

    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    print(url);
    await _webImageDownloader.downloadImageFromUInt8List(uInt8List: bytes);

    // // Uri uri = Uri.parse(url);
    // //
    // // Uint8List bytes = await readBytes(uri);
    //
    //
    // String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    //
    // await FileSaver.instance.saveFile(fileName, bytes, 'jpg',
    //     mimeType: MimeType.JPEG);

  }



}