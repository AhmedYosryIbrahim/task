import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';

Widget offerButton({
  required Widget child,
  required Function() onTap,
}) =>
    MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: const BorderSide(
              style: BorderStyle.solid, color: Constant.defaultColor)),
      onPressed: onTap,
      child: child,
    );
