import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/home_view/home_screen.dart';

import '../profile_view/profile_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();

}

class _LayoutScreenState extends State<LayoutScreen> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

          backgroundColor: Constant.colorBackground,
          appBar: AppBar(

            title: Text(
              'الرئيسية',
              style: ConstantTextStyle.title18WhiteTextStyle,
            ),
            backgroundColor: Constant.layoutAppbar,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    'الرئيسية',
                    style: ConstantTextStyle.title18WhiteTextStyle,
                  ),
                ),
                Tab(
                  child: Text(
                    'حسابي',
                    style: ConstantTextStyle.title18WhiteTextStyle,
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            backgroundColor: Constant.colorBackground,
            child: ListView(
              children: <Widget>[
                Container(
                  color: Constant.iconColor,
                  child: DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Constant.shadowColor,
                          child: Icon(
                            FontAwesomeIcons.solidUser,
                            color: Constant.colorBackground,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'أحمد كرم',
                          style: ConstantTextStyle.title18WhiteTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      title: Text(
                        'الرئيسية',
                        style: ConstantTextStyle.medium14LightBlueTextStyle,
                      ),
                      leading: Icon(
                        Icons.home,
                        color:Constant.iconColor ,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Constant.dividerColor,
                    ),
                    ListTile(
                      title: Text(
                        'حسابي',
                        style: ConstantTextStyle.medium14LightBlueTextStyle,
                      ),
                      leading: Icon(
                        FontAwesomeIcons.solidUser,
                        color: Constant.iconColor,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Constant.dividerColor,
                    ),
                    ListTile(
                      title: Text(
                        'المحفوظات',
                        style: ConstantTextStyle.medium14LightBlueTextStyle,
                      ),
                      leading: Icon(
                        Icons.bookmark,
                        color: Constant.iconColor,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Constant.dividerColor,
                    ),
                    ListTile(
                      title: Text(
                        'تسجيل الخروج',
                        style: ConstantTextStyle.medium14LightBlueTextStyle,
                      ),
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Constant.iconColor,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          body: TabBarView(
            children: [
              const HomeScreen(),
              const ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
