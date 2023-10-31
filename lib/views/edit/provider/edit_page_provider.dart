import 'package:flutter/foundation.dart';

class EditPageProvider extends ChangeNotifier {
  List<String> _editedImages = [];
  double _value = 0;
  String _editedImage = '';

  String get editedImage => _editedImage;

  double get value => _value;

  List get editedImages => _editedImages;

  void setEditImage({required String path}) {
    _editedImage = path;
    notifyListeners();
  }

  void setValue({required double rate}) {
    _value = rate;
    notifyListeners();
  }

  void setEditedImages({required String path}) {
    _editedImages.add(path);
    notifyListeners();
  }
}
