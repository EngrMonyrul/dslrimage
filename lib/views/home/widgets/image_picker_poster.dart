import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/home_page_provider.dart';
import 'image_captured_area.dart';

CupertinoButton buildImagePickerPoster(BuildContext context, HomePageProvider value) {
  return imageCapturedArea(
    context: context,
    widget: Text(
      'Select An Image',
      style: GoogleFonts.libreBaskerville(
        fontSize: 20,
        letterSpacing: 5,
        shadows: CupertinoContextMenu.kEndBoxShadow,
      ),
    ),
    onPressed: () {
      value.setChoosingImgFetcher(choosing: true);
    },
  );
}
