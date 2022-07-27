import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/ConstansColors.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final Color background;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;
  final bool isUpperCase;
  final double radius;
  final Function() function;
  final String text;

  const DefaultButton(
      {Key? key,
      this.width = double.infinity,
      this.background = Constant.defaultColor,
      this.textColor = Constant.textColorWhite,
      this.textSize = 14,
      this.textWeight = FontWeight.w400,
      this.isUpperCase = true,
      this.radius = 10,
      required this.function,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize.sp,
            fontWeight: textWeight,
            fontFamily: 'Almarai',
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
  }
}
