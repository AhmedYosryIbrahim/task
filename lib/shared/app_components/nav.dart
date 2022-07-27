import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

void goToLink({required BuildContext context, required String url}) async {
  if (!await launchUrl(Uri.parse(url))) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: "لا يمكن الوصول لهذا الموقع",
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }
}
