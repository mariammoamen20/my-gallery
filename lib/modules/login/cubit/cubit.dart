import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/models/login_model.dart';
import 'package:gallery/shared/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../../shared/network/end_points.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = false;
  IconData icon = Icons.visibility_off_outlined;
  void changeVisibility(){
    isPassword = !isPassword;
    !isPassword ? icon = Icons.visibility_outlined : icon = Icons.visibility_off_outlined;
    emit(ChangeVisibilityState());
  }
  LoginModel? loginModel;
  void userLogin({
  required String userName,
  required String password,
}) {
    emit(LoginLoadingState());

    DioHelper.postData(
      endPoint: LOGIN,
      data: {
        'email':userName,
        'password':password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(value.data.toString());
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(LoginErrorState());
    });
  }
}
