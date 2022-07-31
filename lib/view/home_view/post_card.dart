import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/helpers/local_storage/local_storage.dart';
import 'package:untitled/models/post_model.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  bool isSaved;

   PostCard({required this.post, this.isSaved = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: post.user!.profileImageUrl != null? null :Constant.shadowColorLight,
                  backgroundImage: post.user!.profileImageUrl != null
                      ? CachedNetworkImageProvider(post.user!.profileImageUrl!)
                      : null,
                  child:post.user!.profileImageUrl != null? null : Icon(
                    FontAwesomeIcons.solidUser,
                    color: Constant.iconColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '${post.user!.firstName!} ${post.user!.lastName!}',
                  style: ConstantTextStyle.medium14BlueTextStyle,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.shareAlt,
                    color: Constant.shadowColor,
                  ),
                ),
                if(isSaved)
                  IconButton(
                  onPressed: () {
                    if (LayoutCubit.get(context)
                        .user!
                        .posts!
                        .contains(post.id)) {
                      LayoutCubit.get(context).unsavePost(postId: post.id!);
                    } else {
                      LayoutCubit.get(context).savePost(postId: post.id!);
                    }
                  },
                  icon: Icon(
                    LayoutCubit.get(context).user!.posts!.contains(post.id)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Constant.shadowColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (post.likes!
                        .contains(LocalStorage.getData(key: 'uId'))) {
                      LayoutCubit.get(context).unlikePost(postId: post.id!);
                    } else {
                      LayoutCubit.get(context).likePost(postId: post.id!);
                    }
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 23.0, left: 18, right: 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          post.likes!.contains(LocalStorage.getData(key: 'uId'))
                              ? Icons.thumb_up
                              : Icons.thumb_up_outlined,
                          color: Constant.shadowColor,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 3.0),
                          color: Constant.shadowColorLight,
                          child: Text(
                            post.likes != null ? '${post.likes!.length}' : '0',
                            style: ConstantTextStyle.medium14BlueTextStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (post.imageUrl != null)
              CachedNetworkImage(imageUrl: post.imageUrl!, fit: BoxFit.cover),
            const SizedBox(
              height: 10,
            ),
            Text(
              post.content!,
              style: ConstantTextStyle.medium14BlueTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
