import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.bouncingBall(color: Constant.textColorBlue, size: 50),
              LoadingAnimationWidget.bouncingBall(color: Constant.defaultColor, size: 50),
              LoadingAnimationWidget.bouncingBall(color: Constant.shadowColor, size: 50),
              LoadingAnimationWidget.bouncingBall(color: Constant.layoutAppbar, size: 50),
            ],
          ),
SizedBox(
            height: 20,
          ),
          Text('جاري التحميل',
            style: ConstantTextStyle.medium14BlueTextStyle
          ),
        ],
      ),
    );
  }
}
