
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/models/gallery_model.dart';
import 'package:gallery/shared/network/remote/dio_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import '../../../shared/network/end_points.dart';

part 'state.dart';

class GalleryCubit extends Cubit<GalleryStates> {
  GalleryCubit() : super(GalleryInitialState());

  static GalleryCubit get(context) => BlocProvider.of(context);

  GalleryModel? galleryModel;
  void getImages() {
    emit(GalleryLoadingState());

    DioHelper.getData(
      endPoint: MY_GALLERY,
    ).then((value) {
      galleryModel = GalleryModel.fromJson(value.data);
      emit(GallerySuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GalleryErrorState());
    });
  }
  Future<File> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    return file;
  }
}
