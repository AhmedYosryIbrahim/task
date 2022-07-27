import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/shared/app_components/default_button.dart';
import 'package:untitled/shared/app_components/offer_button.dart';
import 'package:untitled/shared/app_components/text_button.dart';
import 'package:untitled/shared/app_components/text_form_field.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: SingleChildScrollView(
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
                  validatorInput: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء ادخال اسم المستخدم';
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
                  hideText: true,
                  suffix: Icons.visibility,
                  suffixPressed: () {
                    _passwordController.text =
                        _passwordController.text.isNotEmpty ? '' : '123456';
                  },
                  validatorInput: (value) {
                    if (value!.isEmpty) {
                      return 'كلمة المرور لا يمكن أن تكون فارغة';
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
                    function: () {},
                    text: 'نسيت كلمة المرور؟',
                    fontWeight: FontWeight.w300,
                    color: Constant.textColorBlue,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                DefaultButton(function: () {}, text: 'تسجيل الدخول', radius: 15.r),
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
                        style: ConstantTextStyle.medium14BlackTextStyle),
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
                    child: Text('إذا لم يكن لديك حساب قم بالتسجيل',
                        style: ConstantTextStyle.medium14BlackTextStyle)),
                SizedBox(
                  height: 30.h,
                ),
                offerButton(child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: ConstantTextStyle.content14OrangeTextStyle),


                    ],
                  ),
                ), onTap: () {},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
