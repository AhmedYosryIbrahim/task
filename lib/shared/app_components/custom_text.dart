import 'package:flutter/material.dart';

import '../styles/ConstansColors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? width;
  final double? height;
  final int? maxLines;
  final EdgeInsets? margin;
  final Color color;
  final FontWeight fontWeight;
  final AlignmentDirectional? alignment;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.margin,
    this.width,
    this.height,
    this.maxLines = 1,
    this.color = Constant.textColor1,
    this.alignment,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: alignment,
      width: width,
      height: height,
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(
          // overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Tajawal',
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
      ),
    );
  }
}
