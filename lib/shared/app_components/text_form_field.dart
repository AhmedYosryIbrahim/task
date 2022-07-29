import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/styles/ConstansColors.dart';

// ignore: must_be_immutable
class InputFieldMake extends StatelessWidget {
  String? Function(String?)? validatorInput;
  // ignore: prefer_typing_uninitialized_variables
  Widget? iconInput;
  IconData? suffix;
  Function()? suffixPressed;
  // ignore: prefer_typing_uninitialized_variables
  final inputController;
  bool isNumber;
  int maxNumber;
  int maxLines;
  double setWidth;
  double setHeight;
  bool hideText;
  String? title;
  String? hintText;
  VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  bool readOnly;
  InputFieldMake(
      {Key? key,
      this.setHeight = 0.08,
      this.hideText = false,
      this.maxNumber = 0,
      this.maxLines = 1,
      this.setWidth = .85,
      this.isNumber = false,
      required this.inputController,
      this.title,
      this.hintText,
      this.iconInput,
      this.suffix,
      this.onTap,
      this.suffixPressed,
      this.readOnly = false,
      this.inputFormatters,
      required this.validatorInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.h,
        ),
        width: MediaQuery.of(context).size.width * setWidth,
        height: MediaQuery.of(context).size.height * setHeight,

        //padding: EdgeInsets.all(0),

        child: TextFormField(
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          onTap: onTap,
          keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
          maxLength: isNumber ? maxNumber : null,
          maxLines: maxLines,
          validator: validatorInput,
          controller: inputController,
          obscureText: hideText ? true : false,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
              hintText: hintText,
              errorStyle: const TextStyle(fontWeight: FontWeight.bold),
              prefixIcon: iconInput,
              suffixIcon: suffix != null
                  ? IconButton(
                      onPressed: suffixPressed,
                      icon: Icon(
                        suffix,
                        color: const Color(0xff9C9A99),
                      ),
                    )
                  : null,
              hintStyle:
                  const TextStyle(fontSize: 16, color: Color(0xffAAAAAA)),
              labelStyle:
                  const TextStyle(fontSize: 16, color: Color(0xffAAAAAA)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    width: 2,
                    color: Constant.colorBackground,
                  )),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    width: 2,
                    color: Constant.colorBackground,
                  )),
              labelText: title,
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide:  BorderSide(
                    width: 1,
                    color: Constant.colorBackground,
                  )),
              contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
              counterText: "",
              fillColor: Constant.shadowColorLight,
              filled: true),
        ),
      ),
    );
  }
}
