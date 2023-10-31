import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageButtons(
    {required BuildContext context, required Function() onPressed, required Icon icon, required String name}) {
  return CupertinoButton(
    onPressed: onPressed,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blueGrey,
          child: icon,
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
