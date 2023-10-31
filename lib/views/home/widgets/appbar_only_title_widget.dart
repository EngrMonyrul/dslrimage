import 'package:flutter/material.dart';
import '../constants/home_page_constants.dart';

AppBar buildAppBar({required BuildContext context}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text(homePageAppbarTitle),
    centerTitle: true,
  );
}
