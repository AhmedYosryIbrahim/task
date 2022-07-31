import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/shared/app_components/default_button.dart';
import 'package:untitled/shared/app_components/error_dialog.dart';
import 'package:untitled/shared/app_components/nav.dart';
import 'package:untitled/shared/app_components/text_form_field.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/layout_view/layout_screen.dart';
import 'package:untitled/view/loading_view/loading_screen.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  final UserModel user;

  EditProfileScreen({required this.user, Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _emailController.text = user.email!;
    _firstNameController.text = user.firstName!;
    _lastNameController.text = user.lastName!;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is LayoutEditUserSuccessState || state is LayoutChangeEmailSuccessState){
          LayoutCubit.get(context).changeNavBarIndex(1);

          navigateFinish(context, const LayoutScreen());
        }
        if(state is LayoutEditUserErrorState ){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutChangeEmailErrorState){
          errorDialog(context: context,error:  state.error);
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: state is LayoutEditUserLoadingState
              ? const LoadingScreen()
              : Scaffold(
                  backgroundColor: Constant.colorBackground,
                  appBar: AppBar(
                    iconTheme: IconThemeData(color: Constant.textColorBlue),
                    title: Text(
                      'تعديل الحساب',
                      style: ConstantTextStyle.title18GrayTextStyle,
                    ),
                    backgroundColor: Constant.colorBackground,
                    centerTitle: true,
                    elevation: 0,
                  ),
                  body: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                                    LayoutCubit.get(context).editUser(
                                      email: _emailController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                    );
                                  }
                                },
                                text: 'تحديث الحساب',
                                radius: 15.r),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
