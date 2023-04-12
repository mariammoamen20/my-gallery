import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/modules/gallery/cubit/cubit.dart';
import 'package:gallery/shared/components/components.dart';

class CustomDialogBox extends StatefulWidget {

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryCubit(),
      child: BlocConsumer<GalleryCubit, GalleryStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: contentBox(context),
          );
        },
      ),
    );
  }

  contentBox(context) {
    return Container(
      height: 200.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: Colors.white.withOpacity(
          0.6,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: (){
                  GalleryCubit.get(context).uploadImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/gallery.png',
                      width: 40.0.w,
                      height: 40.0.h,
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    defaultText(
                      text: 'Gallery',
                      size: 14.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/camera_2.png',
                      width: 50.0.w,
                      height: 50.0.h,
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    defaultText(
                      text: 'Camera',
                      size: 14.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
