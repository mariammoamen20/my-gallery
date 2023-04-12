import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/modules/gallery/screens/gallery_screen.dart';
import 'package:gallery/modules/login/cubit/cubit.dart';
import 'package:gallery/shared/components/components.dart';

class LoginWidget extends StatelessWidget {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          debugPrint(
            state.loginModel.token,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GalleryScreen(
                name: userNameController.text,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                      vertical: MediaQuery.of(context).size.width * 0.09,
                    ),
                    child: Image.asset(
                      'assets/images/camera.png',
                      width: 120.0.w,
                      height: 150.0.h,
                    ),
                  ),
                  Center(
                    child: defaultText(
                      text: 'MY Gallery',
                      size: 30.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(
                      20.0,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: Colors.white.withOpacity(
                        0.15,
                      ),
                    ),
                    child: Column(
                      children: [
                        defaultText(
                          text: 'LOG IN',
                          size: 20.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        defaultTextFormFiled(
                          controller: userNameController,
                          text: 'User Name filed is required',
                          hintText: 'User Name',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        defaultTextFormFiled(
                          isPassword: LoginCubit.get(context).isPassword,
                          controller: passwordController,
                          text: 'Password filed is required',
                          hintText: 'Password',
                          suffixPressed: () {
                            LoginCubit.get(context).changeVisibility();
                          },
                          suffixIcon: Icon(
                            LoginCubit.get(context).icon,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => MaterialButton(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            onPressed: () {
                              /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GalleryScreen(
                                    name: userNameController.text,
                                  ),
                                ),
                              );*/
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  userName: userNameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            color: Colors.blue,
                            minWidth: double.infinity,
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
