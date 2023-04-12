import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/modules/gallery/cubit/cubit.dart';
import 'package:gallery/modules/gallery/widgets/custom_dialog.dart';
import 'package:gallery/shared/components/components.dart';

class GalleryWidget extends StatelessWidget {
  String name = ' ';

  GalleryWidget({
    super.key,
    required this.name,
  });

  List<String> images = [
    'assets/images/image_1.jpeg',
    'assets/images/image_2.jpeg',
    'assets/images/images_3.jpeg',
    'assets/images/image_4.jpeg',
    'assets/images/image_5.jpeg',
    'assets/images/image_6.jpeg',
    'assets/images/image_7.jpeg',
    'assets/images/image_8.jpeg',
    'assets/images/image_9.jpeg',
    'assets/images/image_10.jpeg',
    'assets/images/image_11.jpeg',
    'assets/images/image_12.jpeg',
    'assets/images/image_13.jpeg',
    'assets/images/image_14.jpeg',
    'assets/images/image_15.jpeg',
    'assets/images/image_16.jpeg',
    'assets/images/image_17.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: defaultText(
                            text: 'Welcome\n $name',
                            size: 20.0.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            height: 0.9,
                            maxLines: 2,
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(
                            'assets/images/profile_2.jpeg',
                            fit: BoxFit.cover,
                            width: 60.0.w,
                            height: 60.0.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsetsDirectional.all(
                            5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.white,
                          ),
                          width: 120.w,
                          child: Row(
                            children: [
                              Container(
                                width: 30.0.w,
                                height: 22.0.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(
                                      15.0,
                                    )),
                                child: IconButton(
                                  padding: EdgeInsetsDirectional.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 17.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0.w,
                              ),
                              defaultText(
                                text: 'Log out',
                                size: 14.0.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0.w,
                        ),
                        Container(
                          padding: const EdgeInsetsDirectional.all(
                            5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.white,
                          ),
                          width: 120.w,
                          child: Row(
                            children: [
                              Container(
                                width: 30.0.w,
                                height: 22.0.h,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[700],
                                    borderRadius: BorderRadius.circular(
                                      15.0,
                                    )),
                                child: IconButton(
                                  padding: EdgeInsetsDirectional.zero,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CustomDialogBox(
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.upload,
                                    color: Colors.white,
                                    size: 17.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0.w,
                              ),
                              defaultText(
                                text: 'Upload',
                                size: 14.0.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: List.generate(
                        images.length,
                        (index) => ClipRRect(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
