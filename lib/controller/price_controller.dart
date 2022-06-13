import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PriceController extends GetxController{


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

    }


  }


}