import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:camera/camera.dart';
import 'package:dslrimage/views/edit/provider/edit_page_provider.dart';
import 'package:dslrimage/views/home/providers/home_page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class ImageEditPage extends StatefulWidget {
  const ImageEditPage({super.key});

  @override
  State<ImageEditPage> createState() => _ImageEditPageState();
}

class _ImageEditPageState extends State<ImageEditPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<HomePageProvider>(
          builder: (context, value, child) {
            return Center(
              child: Consumer<EditPageProvider>(builder: (context, value2, child) {
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: PhotoView(
                          imageProvider: FileImage(File(value2.editedImage)),
                        ),
                      ),
                    ),
                    Text('Data - ${value2.value.toStringAsFixed(2)}'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Slider(
                        min: 0,
                        max: 1,
                        value: value2.value,
                        onChanged: (rate) {
                          value2.setValue(rate: rate);
                          imageEdit();
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: showModelArea,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blueGrey,
                                child: Text(
                                  'Method\n1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text('Save', style: GoogleFonts.libreBaskerville()),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }

  Future<void> imageEdit() async {
    final homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
    final editPageProvider = Provider.of<EditPageProvider>(context, listen: false);

    try {
      final image =
          img.decodeImage(File(homePageProvider.pickedImages[homePageProvider.selectedImage].path).readAsBytesSync());

      if (image != null) {
        img.adjustColor(image, brightness: editPageProvider.value);

        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/${DateTime.now().millisecondsSinceEpoch}.png');

        file.writeAsBytesSync(img.encodePng(image));
        editPageProvider.setEditImage(path: file.path);
      } else {
        print('Image decoding failed.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  showModelArea() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [],
          scrollable: true,
        );
      },
    );
  }
}
