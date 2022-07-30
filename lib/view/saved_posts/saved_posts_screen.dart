import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/shared/app_components/error_dialog.dart';
import 'package:untitled/shared/app_components/logout_dialog.dart';
import 'package:untitled/shared/app_components/nav.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/home_view/post_card.dart';
import 'package:untitled/view/layout_view/layout_screen.dart';
import 'package:untitled/view/loading_view/loading_screen.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutCubit.get(context).getSavedPosts();
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LayoutLikePostSuccessState) {
          LayoutCubit.get(context).getSavedPosts();
        }
        if (state is LayoutUnlikePostSuccessState) {
          LayoutCubit.get(context).getSavedPosts();
        }
        if(state is LayoutGetSavedPostsErrorState){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutLikePostErrorState){
          errorDialog(context: context,error:  state.error);
        }
        if(state is LayoutUnlikePostErrorState){
          errorDialog(context: context,error:  state.error);
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'المحفوظات',
                style: ConstantTextStyle.title18WhiteTextStyle,
              ),
              backgroundColor: Constant.layoutAppbar,
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
                          color: Constant.iconColor,
                        ),
                        onTap: () {
                          LayoutCubit.get(context).changeNavBarIndex(0);
                          navigateFinish(context, const LayoutScreen());
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
                          LayoutCubit.get(context).changeNavBarIndex(1);
                          navigateFinish(context, const LayoutScreen());
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
                          showDialog(
                              context: context,
                              builder: (context) => const LogoutDialog(
                                title: 'تسجيل خروج',
                                title2: 'هل تود تسجيل خروج ؟',
                              ));                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: Constant.colorBackground,
            body: LayoutCubit.get(context).savedPosts.isEmpty
                ? state is LayoutGetSavedPostsLoadingState
                    ? const LoadingScreen()
                    : const Center(child: Text('لا يوجد منشورات'))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return PostCard(
                        post: LayoutCubit.get(context).savedPosts[index],
                        isSaved: false,
                      );
                    },
                    itemCount: LayoutCubit.get(context).savedPosts.length,
                  ),
          ),
        );
      },
    );
  }
}
