import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        color: const Color(0xff2c3e50),
                      ),
                    )
                  : null,
              hintStyle:
                  const TextStyle(fontSize: 16, color: Color(0xffAAAAAA)),
              labelStyle:
                  const TextStyle(fontSize: 16, color: Color(0xffAAAAAA)),
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
              labelText: title,
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey.shade500,
                  )),
              contentPadding: const EdgeInsets.only(top: 17, bottom: 17),
              counterText: "",
              fillColor: Colors.white,
              filled: true),
        ),
      ),
    );
  }
}
