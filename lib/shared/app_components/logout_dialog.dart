import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/helpers/local_storage/local_storage.dart';
import 'package:untitled/shared/app_components/nav.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:untitled/view/login_view/login_screen.dart';

class LogoutDialog extends StatelessWidget {
  final String title;
  final String title2;

  const LogoutDialog({required this.title2, required this.title});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
      title: Text(
        title2,
        style: const TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
      content: Text(
        title,
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'خروج'),
          child: Container(
            height: MediaQuery.of(context).size.height * .067,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xffC3C6D1))),
            width: MediaQuery.of(context).size.width * .3,
            child: const Center(
              child: Text(
                'تراجع',
                style: TextStyle(color: Constant.defaultColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: ()async {
            await FirebaseAuth.instance.signOut().then((value) async {
              LocalStorage.sharedPreferences.clear();
              navigateFinish(context, LoginScreen());
              await  FirebaseFirestore.instance.clearPersistence();
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * .067,
            width: MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              color: Constant.defaultColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const Center(
              child: Text(
                'مغادرة',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
