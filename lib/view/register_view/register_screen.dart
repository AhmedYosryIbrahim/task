import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/helpers/local_storage/local_storage.dart';
import 'package:untitled/shared/app_components/default_button.dart';
import 'package:untitled/shared/app_components/error_dialog.dart';
import 'package:untitled/shared/app_components/nav.dart';
import 'package:untitled/shared/app_components/text_form_field.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/layout_view/layout_screen.dart';
import 'package:untitled/view/loading_view/loading_screen.dart';
import 'package:untitled/view_model/register_view_model/cubit.dart';
import 'package:untitled/view_model/register_view_model/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppRegisterCubit>(
      create: (context) => AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AppRegisterCreateUserSuccessState) {
            LocalStorage.saveData(key: 'uId', value: state.uId);
            navigateFinish(context, LayoutScreen());
          }
          if (state is AppRegisterCreateUserErrorState) {
            errorDialog(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: state is AppRegisterCreateUserLoadingState
                ? const LoadingScreen()
                : Scaffold(
                    backgroundColor: Constant.colorBackground,
                    appBar: AppBar(
                      iconTheme: IconThemeData(color: Constant.textColorBlue),
                      title: Text(
                        'إنشاء حساب',
                        style: ConstantTextStyle.title18GrayTextStyle,
                      ),
                      backgroundColor: Constant.colorBackground,
                      centerTitle: true,
                      elevation: 0,
                    ),
                    body: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 20.h),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'البريد الالكتروني',
                                style: ConstantTextStyle.medium14BlackTextStyle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputFieldMake(
                                inputController: _emailController,
                                validatorInput: (String? value) {
                                  RegExp regex = RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                  if (value!.isNotEmpty &&
                                      !regex.hasMatch(value.trim())) {
                                    return 'الرجاء ادخال بريد الكتروني صحيح';
                                  }
                                  return null;
                                },
                              ),
                              Text(
                                'كلمة المرور',
                                style: ConstantTextStyle.medium14BlackTextStyle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputFieldMake(
                                inputController: _passwordController,
                                suffix: AppRegisterCubit.get(context).suffix,
                                hideText:
                                    AppRegisterCubit.get(context).isPassword,
                                suffixPressed: () =>
                                    AppRegisterCubit.get(context)
                                        .changePasswordVisibility(),
                                validatorInput: (String? value) {
                                  RegExp regex = RegExp(
                                      r'^(?=.{8,}$)(?=.*?[A-Z])|(?=.*?[0-9])$');
                                  if (value!.isEmpty) {
                                    return 'الرجاء ادخال كلمة المرور';
                                  } else if (!regex.hasMatch(value)) {
                                    return 'الرجاء ادخال كلمة المرور تحتوي علي حرف كبير و رقم';
                                  }
                                  return null;
                                },
                              ),
                              Text(
                                'تأكيد كلمة المرور',
                                style: ConstantTextStyle.medium14BlackTextStyle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputFieldMake(
                                inputController: _confirmPasswordController,
                                suffix: AppRegisterCubit.get(context).suffix,
                                hideText:
                                    AppRegisterCubit.get(context).isPassword,
                                suffixPressed: () =>
                                    AppRegisterCubit.get(context)
                                        .changePasswordVisibility(),
                                validatorInput: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'الرجاء ادخال تأكيد كلمة المرور';
                                  } else if (value !=
                                      _passwordController.text) {
                                    return 'كلمة المرور غير متطابقة';
                                  }
                                  return null;
                                },
                              ),
                              Text(
                                'الاسم الأول',
                                style: ConstantTextStyle.medium14BlackTextStyle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputFieldMake(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[a-z A-Zء-ي]")),
                                ],
                                inputController: _firstNameController,
                                validatorInput: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'الرجاء ادخال الاسم الأول';
                                  } else if (value.length < 2 &&
                                      value.length >= 45) {
                                    return 'الرجاء ادخال الاسم الأول بشكل صحيح';
                                  }
                                  return null;
                                },
                              ),
                              Text(
                                'الاسم الأخير',
                                style: ConstantTextStyle.medium14BlackTextStyle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputFieldMake(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[a-z A-Zء-ي]")),
                                ],
                                inputController: _lastNameController,
                                validatorInput: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'الرجاء ادخال الاسم الأخير';
                                  } else if (value.length < 2 &&
                                      value.length >= 45) {
                                    return 'الرجاء ادخال الاسم الأخير بشكل صحيح';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              DefaultButton(
                                  function: () {
                                    if (_formKey.currentState!.validate()) {
                                      AppRegisterCubit.get(context)
                                          .createAccount(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                      );
                                    }
                                  },
                                  text: 'إنشاء حساب',
                                  radius: 15.r),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
