import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/shared/app_components/default_button.dart';
import 'package:untitled/shared/app_components/text_button.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view/home_view/post_card.dart';
import 'package:untitled/view/loading_view/loading_screen.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LayoutCubit.get(context).getPosts();
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LayoutLikePostSuccessState) {
          LayoutCubit.get(context).getPosts();
        }
        if (state is LayoutUnlikePostSuccessState) {
          LayoutCubit.get(context).getPosts();
        }
        if (state is LayoutSavePostSuccessState) {
          LayoutCubit.get(context).getUser();
        }
        if (state is LayoutUnsavePostSuccessState) {
          LayoutCubit.get(context).getUser();
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          backgroundColor: Constant.colorBackground,
          body: LayoutCubit.get(context).posts.isEmpty
              ? state is LayoutGetPostsLoadingState
                  ? const LoadingScreen()
                  : const Center(child: Text('لا يوجد منشورات'))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return PostCard(
                        post: LayoutCubit.get(context).posts[index]);
                  },
                  itemCount: LayoutCubit.get(context).posts.length,
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierColor: Colors.grey[700],
                  builder: (context) => BlocConsumer<LayoutCubit, LayoutState>(
                        listener: (context, state) {
                          // TODO: implement listener
                          if (state is LayoutCreatePostSuccessState) {
                            LayoutCubit.get(context).getPosts();
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          return Dialog(
                              insetPadding: const EdgeInsets.all(10),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            LayoutCubit.get(context)
                                                .pickPostImageGallery(context);
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 157.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Constant.shadowColorLight,
                                            ),
                                            child: LayoutCubit.get(context)
                                                        .postImage !=
                                                    null
                                                ? Image.file(
                                                    LayoutCubit.get(context)
                                                        .postImage!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons.camera,
                                                        color: Constant
                                                            .shadowColor,
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
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          'اكتب تعليقا حول الصورة',
                                          style: ConstantTextStyle
                                              .content14BlueTextStyle,
                                        ),
                                        TextField(
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          style: ConstantTextStyle
                                              .medium14BlueTextStyle,
                                          maxLines: 2,
                                          maxLength: 120,
                                          controller: _postController,
                                          cursorColor: Constant.defaultColor,
                                          decoration: const InputDecoration(
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
                                              function: () {
                                                LayoutCubit.get(context)
                                                    .uploadPostImage(
                                                        content: _postController
                                                            .text);
                                              },
                                              text: 'نشر',
                                              width: 100.w,
                                              radius: 5,
                                              textSize: 16.sp,
                                            ),
                                            DefaultTextButton(
                                              function: () {
                                                Navigator.pop(context);
                                              },
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
                              ));
                        },
                      ));
            },
            backgroundColor: Constant.defaultColor,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
