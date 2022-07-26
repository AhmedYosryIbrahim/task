import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/ConstansColors.dart';

class AlertDialogWidget extends StatelessWidget {
  @override
  final String title;
  final String title2;

  const AlertDialogWidget({required this.title2, required this.title});
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
            child: const Center(
              child: Text(
                'تراجع',
                style: TextStyle(color: Constant.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
            width: MediaQuery.of(context).size.width * .3,
          ),
        ),
        TextButton(
          onPressed: ()async {
            await FirebaseAuth.instance.signOut().then((value) {
              // LocalStorage.sharedPreferences.clear();
              // navigateFinish(context, LoginScreen());
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * .067,
            child: const Center(
              child: Text(
                'مغادرة',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            width: MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              color: Constant.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
