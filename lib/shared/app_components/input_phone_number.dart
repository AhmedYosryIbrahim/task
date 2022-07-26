import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

Widget phoneWidget(TextEditingController phone) {
  return InternationalPhoneNumberInput(
    onInputChanged: (PhoneNumber number) {
      debugPrint(number.phoneNumber);
      debugPrint(number.isoCode);
      phone.text = number.phoneNumber!;
    },
    locale: "ar",
    initialValue: PhoneNumber(isoCode: "EG"),
    inputDecoration: InputDecoration(
      errorStyle: const TextStyle(fontWeight: FontWeight.bold),
      labelText: 'رقم الهاتف',
      labelStyle: const TextStyle(
        color: Color(0xffAAAAAA),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade200,
          )),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade500,
          )),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade500,
        ),
      ),
    ),
    validator: (input) {
      if (input!.trim().isEmpty) {
        return "من فضلك ادخل رقم الجوال";
      } else if (input.trim().length < 9) {
        return "رقم الجوال لا يجب أن يقل عن 9 ارقام";
      }
      return null;
    },
    selectorConfig: const SelectorConfig(
      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
    ),
    ignoreBlank: false,
    maxLength: 11,
    autoValidateMode: AutovalidateMode.disabled,
    selectorTextStyle: const TextStyle(color: Colors.black),
    formatInput: false,
    inputBorder: InputBorder.none,
    onSaved: (PhoneNumber number) {
      debugPrint('On Saved: $number');
    },
  );
}
