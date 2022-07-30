import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/shared/app_components/error_dialog.dart';
import 'package:untitled/shared/app_components/logout_dialog.dart';
import 'package:untitled/shared/app_components/nav.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/home_view/home_screen.dart';
import 'package:untitled/view/loading_view/loading_screen.dart';
import 'package:untitled/view/saved_posts/saved_posts_screen.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';

import '../profile_view/profile_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is LayoutGetUserErrorState ){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutGetPostsErrorState){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutLikePostErrorState){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutUnlikePostErrorState){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutSavePostErrorState){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutUnsavePostErrorState){
          errorDialog(context: context,error:  state.error);
        }

      },
      builder: (context, state) {
        return LayoutCubit.get(context).user == null
            ? const LoadingScreen()
            : DefaultTabController(
                length: 2,
                initialIndex: LayoutCubit.get(context).currentIndex,
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
                        onTap: (int index) =>
                            LayoutCubit.get(context).changeNavBarIndex(index),
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
                                    child: const Icon(
                                      FontAwesomeIcons.solidUser,
                                      color: Constant.colorBackground,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    '${LayoutCubit.get(context).user!.firstName} ${LayoutCubit.get(context).user!.lastName}',
                                    style:
                                        ConstantTextStyle.title18WhiteTextStyle,
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
                                  style: ConstantTextStyle
                                      .medium14LightBlueTextStyle,
                                ),
                                leading: Icon(
                                  Icons.home,
                                  color: Constant.iconColor,
                                ),
                                onTap: () {
                                  LayoutCubit.get(context).changeNavBarIndex(0);
                                  navigateFinish(context, LayoutScreen());
                                },
                              ),
                              Divider(
                                color: Constant.dividerColor,
                              ),
                              ListTile(
                                title: Text(
                                  'حسابي',
                                  style: ConstantTextStyle
                                      .medium14LightBlueTextStyle,
                                ),
                                leading: Icon(
                                  FontAwesomeIcons.solidUser,
                                  color: Constant.iconColor,
                                ),
                                onTap: () {
                                  LayoutCubit.get(context).changeNavBarIndex(1);
                                  navigateFinish(context, LayoutScreen());
                                },
                              ),
                              Divider(
                                color: Constant.dividerColor,
                              ),
                              ListTile(
                                title: Text(
                                  'المحفوظات',
                                  style: ConstantTextStyle
                                      .medium14LightBlueTextStyle,
                                ),
                                leading: Icon(
                                  Icons.bookmark,
                                  color: Constant.iconColor,
                                ),
                                onTap: () {
                                  navigateTo(context, SavedPostsScreen());
                                },
                              ),
                              Divider(
                                color: Constant.dividerColor,
                              ),
                              ListTile(
                                title: Text(
                                  'تسجيل الخروج',
                                  style: ConstantTextStyle
                                      .medium14LightBlueTextStyle,
                                ),
                                leading: Icon(
                                  Icons.exit_to_app,
                                  color: Constant.iconColor,
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => const LogoutDialog(
                                            title: 'تسجيل خروج',
                                            title2: 'هل تود تسجيل خروج ؟',
                                          ));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    body: LayoutCubit.get(context)
                        .screens[LayoutCubit.get(context).currentIndex],
                  ),
                ),
              );
      },
    );
  }
}
