import 'package:cloud_firestore/cloud_firestore.dart';

class StickerModel {
  String? id;
  String? stickerImage;
  String? stickerName;

  StickerModel({
    this.id,
    this.stickerImage,
    this.stickerName,
  });

  StickerModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    stickerImage = doc["stickerImage"];
    stickerName = doc["stickerName"];
  }

}