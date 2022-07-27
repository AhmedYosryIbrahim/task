import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/ConstansColors.dart';

// ignore: must_be_immutable
class CustomDropDrown extends StatelessWidget {
  CustomDropDrown(
      {Key? key,
      this.margin,
      required this.value,
      required this.items,
      required this.onChanged,
      this.prefixIcon})
      : super(key: key);

  final String value;
  Widget? prefixIcon;
  final List<String> items;
  final void Function(String?)? onChanged;
  double? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin ?? 15),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xffE6E6E6),
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            prefixIcon: prefixIcon ??
                SvgPicture.asset(
                  "assets/images/drop_icon.svg",
                  fit: BoxFit.scaleDown,
                ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              iconSize: 50,
              iconEnabledColor: Constant.colorIcon1,
              elevation: 16,
              //style: const TextStyle(color: Colors.deepPurple),
              // onChanged: (String? newValue) {
              //   cubit.changeDropDownVal2(newValue!);
              // },
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
