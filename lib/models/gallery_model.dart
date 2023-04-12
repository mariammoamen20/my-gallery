

import 'package:flutter/cupertino.dart';

class GalleryModel {
  String? status;
  ImagesModel? data;
  String? message;

  GalleryModel.fromJson(dynamic json) {
    status = json["status"];
    data = json["data"] != null ? ImagesModel.fromJson(json["data"]) : null;
    message = json["message"];
  }

}

class ImagesModel {
  List<String>? images;
  ImagesModel.fromJson(dynamic json) {
    images = json["images"] != null ? json["images"].cast<String>() : [];
  }

}