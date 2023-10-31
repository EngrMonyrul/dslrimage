import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoButton imageCapturedArea({required BuildContext context, Function()? onPressed, required Widget widget}) {
  return CupertinoButton(
    onPressed: onPressed,
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(5),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: widget,
      ),
    ),
  );
}
