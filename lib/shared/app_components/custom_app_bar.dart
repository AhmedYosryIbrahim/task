import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/ConstansColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Widget? leading;
  final Widget? child;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.height = kToolbarHeight,
    this.leading,
    this.actions,
    this.child,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      elevation: 0.5,
      title: Text(
        title,
        style: TextStyle(color: Constant.secondaryColor, fontSize: 16.sp),
      ),
      toolbarHeight: kToolbarHeight,
      leading: leading,
      actions: actions,
      flexibleSpace: child,
    );
  }
}
