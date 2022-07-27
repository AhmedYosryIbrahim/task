import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/shared/app_components/default_button.dart';
import 'package:untitled/shared/app_components/text_button.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        backgroundColor: Constant.colorBackground,
        body: ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Constant.shadowColorLight,
                      child: Icon(
                        FontAwesomeIcons.solidUser,
                        color: Constant.iconColor,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.shareAlt,
                        color: Constant.shadowColor,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.bookmark,
                        color: Constant.shadowColor,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 23.0,left: 18,right: 18),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: Constant.shadowColor,
                              ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal:  6.0,vertical: 3.0),
                              color: Constant.shadowColorLight,
                              child: Text(
                                '5',
                                style: ConstantTextStyle.medium14BlueTextStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/postImg2.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة , لقد تم توليد هذا النص من مولد النص',
                  style: ConstantTextStyle.medium14BlueTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierColor: Colors.grey[700],
              builder: (context) => Dialog(

                  insetPadding: EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 157.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Constant.shadowColorLight,

                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.camera,
                                    color: Constant.shadowColor,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'رفع صورة',
                                    style: ConstantTextStyle
                                        .medium14BlueTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:20.h,
                            ),
                            Text(
                              'اكتب تعليقا حول الصورة',
                              style:
                              ConstantTextStyle.content14BlueTextStyle,
                            ),
                            TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style:
                              ConstantTextStyle.medium14BlueTextStyle,
                              maxLines: 2,
                              maxLength: 120,
                              cursorColor: Constant.defaultColor,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Constant.defaultColor,
                                  ),
                                ),
                                hintText: 'أدخل التعليق',
                              ),
                            ),
                            Row(
                              children: [
                                DefaultButton(
                                  function: () {},
                                  text: 'نشر',
                                  width: 100.w,
                                  radius: 5,
                                  textSize: 16.sp,
                                ),
                                DefaultTextButton(
                                  function: () {},
                                  text: 'تجاهل',
                                  color: Constant.defaultColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )));
        },
        backgroundColor: Constant.defaultColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
