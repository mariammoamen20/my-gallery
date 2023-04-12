import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/modules/login/cubit/cubit.dart';
import 'package:gallery/modules/login/widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>LoginCubit(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color(0xffbbb4da),
                Color(0xffacaccc),
                Color(0xff99acc7),
                Color(0xffbfc7c1),
              ],
            ),
          ),
          child: LoginWidget(),
        ),
      ),
    );
  }
}
