import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/helpers/local_storage/local_storage.dart';
import 'package:untitled/shared/app_components/default_button.dart';
import 'package:untitled/shared/app_components/error_dialog.dart';
import 'package:untitled/shared/app_components/nav.dart';
import 'package:untitled/shared/app_components/offer_button.dart';
import 'package:untitled/shared/app_components/text_button.dart';
import 'package:untitled/shared/app_components/text_form_field.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/layout_view/layout_screen.dart';
import 'package:untitled/view/loading_view/loading_screen.dart';
import 'package:untitled/view/register_view/register_screen.dart';
import 'package:untitled/view_model/login_view_model/cubit.dart';
import 'package:untitled/view_model/login_view_model/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AppLoginSuccessState) {
          LocalStorage.saveData(key: 'uId', value: state.uId);
          navigateFinish(context, LayoutScreen());
        }
        if(state is AppLoginErrorState){
          errorDialog(context: context,error:  state.error);
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: state is AppLoginLoadingState
              ? const LoadingScreen()
              : Scaffold(
                  backgroundColor: Constant.colorBackground,
                  appBar: AppBar(
                    title: Text(
                      'تسجيل الدخول',
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
                              'اسم المستخدم',
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
                                if ((value!.isNotEmpty &&
                                        !regex.hasMatch(value.trim())) ||
                                    value.isEmpty) {
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
                              suffix: AppLoginCubit.get(context).suffix,
                              hideText: AppLoginCubit.get(context).isPassword,
                              suffixPressed: () => AppLoginCubit.get(context)
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
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              alignment: AlignmentDirectional.topEnd,
                              child: DefaultTextButton(
                                function: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      height: MediaQuery.of(context)
                                              .size
                                              .height *
                                          0.3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'استرجاع كلمة المرور',
                                            style: ConstantTextStyle.medium14BlackTextStyle,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          TextFormField(
                                            controller: _emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              hintText: 'البريد الالكتروني',
                                              hintStyle: ConstantTextStyle.medium14BlackTextStyle,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.w),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          DefaultButton(
                                            text: 'ارسال',
                                            function: () {
                                              AppLoginCubit.get(context)
                                                  .forgotPassword(
                                                     email:  _emailController.text);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                text: 'نسيت كلمة المرور؟',
                                fontWeight: FontWeight.w300,
                                color: Constant.textColorBlue,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            DefaultButton(
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    AppLoginCubit.get(context).login(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                  }
                                },
                                text: 'تسجيل الدخول',
                                radius: 15.r),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Constant.dividerColor,
                                    thickness: 1.h,
                                  ),
                                ),
                                Text('      أو      ',
                                    style: ConstantTextStyle
                                        .medium14BlackTextStyle),
                                Expanded(
                                  child: Divider(
                                    color: Constant.dividerColor,
                                    thickness: 1.h,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                    'إذا لم يكن لديك حساب قم بالتسجيل',
                                    style: ConstantTextStyle
                                        .medium14BlackTextStyle)),
                            SizedBox(
                              height: 30.h,
                            ),
                            offerButton(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 20.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.userPlus,
                                      color: Constant.defaultColor,
                                      size: 14.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text('تسجيل حساب جديد',
                                        style: ConstantTextStyle
                                            .content14OrangeTextStyle),
                                  ],
                                ),
                              ),
                              onTap: () {
                                navigateTo(context, RegisterScreen());
                              },
                            ),
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
