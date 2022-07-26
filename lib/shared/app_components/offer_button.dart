import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget offerButton({
  required String iconImage,
  required String text,
  required Function() onTap,
}) =>
    Column(
      children: [
        MaterialButton(
          minWidth: 96.w,
          height: 57.h,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(style: BorderStyle.solid,color: Colors.grey.shade300)),
          onPressed: onTap,
          child: SvgPicture.asset(iconImage),
        ),
        Text(text ,style: const TextStyle(fontSize: 14),)
      ],
    );
