import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorBackground,
      body: Column(
        children: [
          Container(
            height: 0.4.sh,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  child: Container(
                    height: 0.3.sh,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          4.0,
                        ),
                        topRight: Radius.circular(
                          4.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/postImg.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                CircleAvatar(
                  radius: 84.0.r,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 80.0.r,
                    backgroundImage: AssetImage(
                      'assets/images/postImg.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'اسم المستخدم',
            style: ConstantTextStyle.title18GrayTextStyle,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'AhmedYosry@gmail.com',
            style: ConstantTextStyle.content14BlueTextStyle,
          ),
          SizedBox(
            height: 0.1.sh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Constant.defaultColor,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'تعديل بياناتي',
                    style: ConstantTextStyle.medium14BlueTextStyle,
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Constant.defaultColor,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'الإعدادات',
                    style: ConstantTextStyle.medium14BlueTextStyle,
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Constant.defaultColor,
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'المفضلة',
                    style: ConstantTextStyle.medium14BlueTextStyle,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
