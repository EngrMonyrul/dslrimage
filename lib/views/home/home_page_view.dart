import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dslrimage/views/home/constants/home_page_constants.dart';
import 'package:dslrimage/views/home/providers/home_page_provider.dart';
import 'package:dslrimage/views/home/widgets/appbar_only_title_widget.dart';
import 'package:dslrimage/views/home/widgets/image_buttons.dart';
import 'package:dslrimage/views/home/widgets/image_captured_area.dart';
import 'package:dslrimage/views/home/widgets/image_picker_area.dart';
import 'package:dslrimage/views/home/widgets/image_picker_poster.dart';
import 'package:dslrimage/views/home/widgets/recent_file_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: SingleChildScrollView(
        child: Consumer<HomePageProvider>(
          builder: (context, value, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: (value.pickedImages.isEmpty)
                        ? const Center(child: Text(emptyRecentPic))
                        : buildRecentFiles(value: value, context: context),
                  ),
                  value.choosingImgFetcher
                      ? buildImagePickerArea(context: context, value: value, imagePicker: imagePicker)
                      : buildImagePickerPoster(context, value),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
