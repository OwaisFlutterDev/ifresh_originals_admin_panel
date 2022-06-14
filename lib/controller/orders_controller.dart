import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/model/order_model.dart';
import 'package:intl/intl.dart';

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



}