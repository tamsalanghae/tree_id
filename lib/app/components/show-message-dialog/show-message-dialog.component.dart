import 'package:dalbergia_id/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void createDialogShowMessageAndAction({
  required BuildContext context,
  required String title,
  double? top,
  String? message,
  String? titleLeftButton,
  String? titleRightButton,
  void Function(BuildContext context)? leftAction,
  void Function(BuildContext context)? rightAction,
  bool barrierDismissible = true,
}) {
  showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(title,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor, fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(message ?? "", style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        if (leftAction != null && titleLeftButton != null)
                          GestureDetector(
                            onTap: () => leftAction.call(context),
                            behavior: HitTestBehavior.translucent,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(titleLeftButton, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor)),
                            ),
                          ),
                        if (rightAction != null && titleRightButton != null)
                          GestureDetector(
                            onTap: () => rightAction.call(context),
                            behavior: HitTestBehavior.translucent,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(titleRightButton, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor)),
                            ),
                          ),
                        SizedBox(width: 1.w)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
}
