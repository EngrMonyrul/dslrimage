import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class HomePageProvider extends ChangeNotifier {
  bool _choosingImgFetcher = false;
  List<XFile> _pickedImages = [];
  int _selectedImage = 0;

  int get selectedImage => _selectedImage;

  List<XFile> get pickedImages => _pickedImages;

  bool get choosingImgFetcher => _choosingImgFetcher;

  void setSelectedImage({required int index}) {
    _selectedImage = index;
    notifyListeners();
  }

  void setPickedImages({required XFile image}) {
    _pickedImages.add(image);
    _selectedImage = _pickedImages.length - 1;
    notifyListeners();
  }

  void setDeleteImages({required int index}) {
    _pickedImages.removeAt(index);
    notifyListeners();
  }

  void setChoosingImgFetcher({required bool choosing}) {
    _choosingImgFetcher = choosing;
    notifyListeners();
  }
}
