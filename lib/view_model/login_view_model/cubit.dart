import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view_model/login_view_model/states.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility : Icons.visibility_off;
    emit(AppLoginChangePasswordVisibilityState());
  }

  // login with email and password and add user to firebase firestore
  void login({
    required String email,
    required String password,
  }) async {
    emit(AppLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(AppLoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(AppLoginErrorState(error.toString()));
    });
  }
  // forgot password
  void forgotPassword({
    required String email,
  }) async {
    emit(AppLoginResetPasswordLoadingState());
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      emit(AppLoginResetPasswordSuccessState());
    }).catchError((error) {
      emit(AppLoginResetPasswordErrorState(error.toString()));
    });
  }
}
