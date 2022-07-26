import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import '../styles/ConstansColors.dart';

// ignore: must_be_immutable
class CustomDropDownSearch extends StatelessWidget {
  CustomDropDownSearch(
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
  final  Function onChanged;
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
            const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            prefixIcon: prefixIcon ??
                SvgPicture.asset(
                  "assets/images/drop_icon.svg",
                  fit: BoxFit.scaleDown,
                ),
          ),
          child:SearchableDropdown.single(
            items: items
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: value,
            hint: value,
            searchHint: value,

            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Constant.primaryColor,
              size: 35,
            ),
            underline: Container(
              height: 1,
              color: Colors.white,
            ),
            onChanged: onChanged,
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}
