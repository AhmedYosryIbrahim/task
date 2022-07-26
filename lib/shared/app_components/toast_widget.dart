import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

toastWidget({required String massage, required Color color}) {
  return showToast(
    massage,
    duration: const Duration(seconds: 5),
    position: ToastPosition.bottom,
    radius: 13.0,
    // backgroundColor: color,
    backgroundColor: color,
    textPadding: const EdgeInsets.all(20),
    textStyle: const TextStyle(fontSize: 16 , color: Colors.white),
  );
}
