import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProviderr extends ChangeNotifier {
  ImageProvider? selectedImage;
  ImagePicker imagePicker = ImagePicker();

  void setImage(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);

    selectedImage =
        pickedImage != null ? FileImage(File(pickedImage.path)) : null;
    notifyListeners();
  }
}
