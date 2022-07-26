import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

Widget imagePicker({
  File? image,
  String? text,
}) =>
    Column(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          height: 70.h,
          width: 101.w,
          child: image != null
              ? Image(
                  fit: BoxFit.cover,
                  image: FileImage(
                    image,
                  ))
              : const Icon(
                  Icons.add,
                  size: 44,
                ),
        ),
        CustomText(
          text: text ?? '',
          color: Colors.black,
          fontSize: 12.sp,
        )
      ],
    );
