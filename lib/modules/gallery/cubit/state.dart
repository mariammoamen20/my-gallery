part of 'cubit.dart';

@immutable
abstract class GalleryStates {}

class GalleryInitialState extends GalleryStates {}

class GalleryLoadingState extends GalleryStates {}

class GallerySuccessState extends GalleryStates {}

class GalleryErrorState extends GalleryStates {}

class UploadImageLoadingState extends GalleryStates {}

class UploadImageSuccessState extends GalleryStates {}

class UploadImageErrorState extends GalleryStates {}
