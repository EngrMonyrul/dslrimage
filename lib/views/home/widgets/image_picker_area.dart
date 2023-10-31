import 'package:dslrimage/views/edit/image_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../edit/provider/edit_page_provider.dart';
import '../providers/home_page_provider.dart';
import 'image_buttons.dart';
import 'image_captured_area.dart';

CupertinoButton buildImagePickerArea(
    {required BuildContext context, required HomePageProvider value, required ImagePicker imagePicker}) {
  return imageCapturedArea(
    context: context,
    widget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        imageButtons(
          context: context,
          icon: const Icon(
            CupertinoIcons.camera,
            color: Colors.white,
            size: 45,
          ),
          name: 'Camera',
          onPressed: () async {
            final image = await imagePicker.pickImage(source: ImageSource.camera).then(
                  (imgValue) => value.setPickedImages(
                    image: imgValue!,
                  ),
                );
            final homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
            final editPageProvider = Provider.of<EditPageProvider>(context, listen: false);
            editPageProvider.setEditImage(path: homePageProvider.pickedImages[homePageProvider.selectedImage].path);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageEditPage()));
          },
        ),
        imageButtons(
          context: context,
          icon: Icon(
            CupertinoIcons.photo,
            color: Colors.white,
            size: 45,
          ),
          name: 'Gallery',
          onPressed: () async {
            final image = await imagePicker.pickImage(source: ImageSource.gallery).then(
                  (imgValue) => value.setPickedImages(
                    image: imgValue!,
                  ),
                );
            final homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
            final editPageProvider = Provider.of<EditPageProvider>(context, listen: false);
            editPageProvider.setEditImage(path: homePageProvider.pickedImages[homePageProvider.selectedImage].path);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageEditPage()));
          },
        ),
      ],
    ),
  );
}
