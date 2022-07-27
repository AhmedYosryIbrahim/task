import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/app_components/default_button.dart';
import 'package:untitled/shared/app_components/text_form_field.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Constant.colorBackground,
        appBar: AppBar(
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: SingleChildScrollView(
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
                Text(
                  'تأكيد كلمة المرور',
                  style: ConstantTextStyle.medium14BlackTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InputFieldMake(
                  inputController: _confirmPasswordController,
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
                Text(
                  'الاسم الأول',
                  style: ConstantTextStyle.medium14BlackTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InputFieldMake(
                  inputController: _firstNameController,
                  validatorInput: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء ادخال اسم المستخدم';
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
                  inputController: _lastNameController,
                  validatorInput: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء ادخال اسم المستخدم';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                DefaultButton(function: () {}, text: 'إنشاء حساب', radius: 15.r),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
