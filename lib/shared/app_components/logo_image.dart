import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoImage extends StatelessWidget {
  final double width;
  // final double height;
  final double margin;
  final double padding;

  const LogoImage({
    Key? key,
    required this.width,
    // required this.height,
    this.margin = 0,
    this.padding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        //     width: double.infinity,
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        child: Image.asset(
          'assets/images/image/logo_image.png',
          fit: BoxFit.fill,
          width: width.w,
        ));
  }
}
