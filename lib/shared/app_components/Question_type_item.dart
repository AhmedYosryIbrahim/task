// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
// class QuestionTypeItem extends StatelessWidget {
//   const QuestionTypeItem(
//       {Key? key,
//         required this.question,
//         required this.backgroundColor,
//         required this.textColor,
//         required this.onTap})
//       : super(key: key);
//
//   final FeqModel question;
//
//   final Color backgroundColor;
//   final Color textColor;
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         width: 100.w,
//         height: 40.h,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           question.category!,
//           style: TextStyle(color: textColor),
//         ),
//       ),
//     );
//   }
// }
