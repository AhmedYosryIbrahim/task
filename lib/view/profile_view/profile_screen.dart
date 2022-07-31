import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/app_components/nav.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/edit_profile_view/edit_profile_screen.dart';
import 'package:untitled/view/saved_posts/saved_posts_screen.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';

import '../../shared/app_components/logout_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutCubit.get(context).getUser();
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Constant.colorBackground,
          body: Column(
            children: [
              Container(
                height: 0.4.sh,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    InkWell(
                      onTap: () {
                        LayoutCubit.get(context).pickCoverImage();
                      },
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 0.3.sh,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                4.0,
                              ),
                              topRight: Radius.circular(
                                4.0,
                              ),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: LayoutCubit.get(context)
                                          .user!
                                          .coverImageUrl ==
                                      null
                                  ? const AssetImage(
                                'assets/images/camera.png',
                                    )
                                  :  CachedNetworkImageProvider( LayoutCubit.get(context).user!.coverImageUrl!) as ImageProvider,

                            ),
                          ),
                          child: state is LayoutPickCoverImageLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox(),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        LayoutCubit.get(context).pickProfileImage();
                      },
                      child: CircleAvatar(
                        radius: 84.0.r,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          backgroundColor: Constant.colorBackground,
                          radius: 80.0.r,
                          backgroundImage:
                              LayoutCubit.get(context).user!.profileImageUrl ==
                                      null
                                  ? const AssetImage(
                                      'assets/images/camera.png',
                                    )
                                  :  CachedNetworkImageProvider( LayoutCubit.get(context).user!.profileImageUrl!) as ImageProvider,
                          child: state is LayoutPickProfileImageLoadingState
                              ? const CircularProgressIndicator()
                              : const SizedBox(),
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
                '${LayoutCubit.get(context).user!.firstName} ${LayoutCubit.get(context).user!.lastName}',
                style: ConstantTextStyle.title18GrayTextStyle,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                '${LayoutCubit.get(context).user!.email}',
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
                      InkWell(
                        onTap: () {
                          navigateTo(
                              context,
                              EditProfileScreen(
                                user: LayoutCubit.get(context).user!,
                              ));
                        },
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Constant.defaultColor,
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
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
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const LogoutDialog(
                            title: 'تسجيل خروج',
                            title2: 'هل تود تسجيل خروج ؟',
                          ));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Constant.defaultColor,
                          child: const Icon(
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
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context, const SavedPostsScreen());
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Constant.defaultColor,
                          child: const Icon(
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
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
