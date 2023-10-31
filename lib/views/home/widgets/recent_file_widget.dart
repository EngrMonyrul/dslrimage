import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dslrimage/views/edit/image_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../edit/provider/edit_page_provider.dart';
import '../providers/home_page_provider.dart';

Widget buildRecentFiles({required HomePageProvider value, required BuildContext context}) {
  return CarouselSlider(
    options: CarouselOptions(
      height: MediaQuery.of(context).size.height * .7,
      autoPlay: false,
      viewportFraction: 0.8,
      animateToClosest: true,
      scrollPhysics: const BouncingScrollPhysics(),
      enlargeCenterPage: true,
    ),
    items: value.pickedImages.asMap().entries.map((e) {
      return Stack(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              value.setSelectedImage(index: e.key);
              final homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
              final editPageProvider = Provider.of<EditPageProvider>(context, listen: false);
              editPageProvider.setEditImage(path: homePageProvider.pickedImages[homePageProvider.selectedImage].path);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageEditPage()));
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.file(
                File(e.value.path),
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              onPressed: () {
                value.setDeleteImages(index: e.key);
              },
              icon: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                child: const Icon(
                  CupertinoIcons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      );
    }).toList(),
  );
}
