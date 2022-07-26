import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import '../styles/ConstansColors.dart';

// ignore: must_be_immutable
class CustomMultiDropList extends StatelessWidget {
  CustomMultiDropList(
      {Key? key,
      this.margin,
      required this.value,
      required this.items,
      required this.onChanged(val),
      this.prefixIcon})
      : super(key: key);

  final String value;
  Widget? prefixIcon;
  final List<MultiSelectItem> items;
  final Function(List) onChanged;
  double? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin ?? 0),
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
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            prefixIcon: prefixIcon ??
                SvgPicture.asset(
                  "assets/images/drop_icon.svg",
                  fit: BoxFit.scaleDown,
                ),
          ),
          child: MultiSelectDialogField(
            searchable: true,
            searchIcon: const Icon(Icons.search_outlined),
            items: items,
            title:  Text("المدن التي تعمل بها",style: TextStyle(fontSize: 14.sp),),
            selectedColor: Colors.blue,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            buttonIcon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 35,
              color: Constant.primaryColor,
            ),
            buttonText: const Text(
              "المدن التي تعمل بها",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onConfirm: onChanged,
          ),
        ),
      ),
    );
  }
}
