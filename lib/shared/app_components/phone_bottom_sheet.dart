import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';
import 'package:url_launcher/url_launcher.dart';

phoneBottomSheet({
  required BuildContext context,
  required String phone,
  String? secondPhone,
  String? thirdPhone,
}) {
  return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "ارقام الهاتف",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Constant.secondaryColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListTile(
            trailing: const Icon(Icons.phone, color: Colors.green),
            onTap: () {
              Uri uri = Uri(scheme: 'tel', path: phone.replaceAll(' ', ''));
              launchUrl(uri);
            },
            title: Text(
              phone.replaceAll('+2', ''),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          if(secondPhone !=null)
            ListTile(
            trailing: const Icon(Icons.phone, color: Colors.green),
            onTap: () {
              Uri uri = Uri(scheme: 'tel', path: secondPhone.replaceAll(' ', ''));
              launchUrl(uri);
            },
            title: Text(
              secondPhone.replaceAll('+2', ''),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          if(thirdPhone !=null)
          ListTile(
            trailing: const Icon(Icons.phone, color: Colors.green),
            onTap: () {
              Uri uri = Uri(scheme: 'tel', path: thirdPhone.replaceAll(' ', ''));
              launchUrl(uri);
            },
            title: Text(
              thirdPhone.replaceAll('+2', ''),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ));
}
