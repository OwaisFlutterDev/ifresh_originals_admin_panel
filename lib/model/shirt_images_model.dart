import 'package:cloud_firestore/cloud_firestore.dart';

class ShirtImageModel {
  String? id;
  String? frontImage;
  String? backImage;
  String? shirtName;


  ShirtImageModel({
    this.id,
    this.frontImage,
    this.shirtName,
    this.backImage
  });

  ShirtImageModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    frontImage = doc["frontImage"];
    shirtName = doc["shirtName"];
    backImage = doc["backImage"];

  }

}