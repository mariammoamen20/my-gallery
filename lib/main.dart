import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/bloc_observer.dart';
import 'package:gallery/modules/gallery/screens/gallery_screen.dart';
import 'package:gallery/shared/network/remote/dio_helper.dart';
import 'package:gallery/shared/styles/themes.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home:   GalleryScreen(name: 'Mariam'),
      ),
    );
  }
}
