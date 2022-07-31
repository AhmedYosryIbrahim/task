import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/view_model/register_view_model/states.dart';


class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility : Icons.visibility_off;
    emit(AppRegisterChangePasswordVisibilityState());
  }

  // create account with email and password and add user to firebase firestore
  void createAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(AppRegisterCreateUserLoadingState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      User user = value.user!;
      UserModel userModel = UserModel(
        uId: user.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        createdAt: DateTime.now().toIso8601String(),
      );
      FirebaseFirestore.instance.collection('users').doc(user.uid).set(userModel.toJson());
      emit(AppRegisterCreateUserSuccessState(user.uid));
    }).catchError((error) {
      emit(AppRegisterCreateUserErrorState(error.toString()));
    });
  }
}
