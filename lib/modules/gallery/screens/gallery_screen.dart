import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/modules/gallery/cubit/cubit.dart';
import 'package:gallery/modules/gallery/widgets/gallery_widget.dart';

class GalleryScreen extends StatelessWidget {
  String name = ' ';

  GalleryScreen({super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryCubit()..getImages(),
      child: Scaffold(
        backgroundColor: const Color(0xffc6cfcc),
        body: GalleryWidget(name: name,),
      ),
    );
  }
}
