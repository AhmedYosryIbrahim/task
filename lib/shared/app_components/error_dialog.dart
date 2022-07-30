import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void errorDialog({required BuildContext context, required String error})=>
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'خطأ في الإتصال',
        desc: error,
        btnOkOnPress: () {},
        btnOkIcon: Icons.check_circle,
        btnOkColor: Colors.red,
        btnOkText: 'Ok',
      ).show();
