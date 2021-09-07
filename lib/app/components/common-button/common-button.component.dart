import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  late final double width;
  final double height;

  CommonButton({
    required this.onPressed,
    required this.child,
    required this.backgroundColor,
    double? width,
    double? height,
  })  : height = height ?? 5.h,
        width = width ?? 80.w;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: child,
      ),
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.sp)),
      ),
    );
  }
}
