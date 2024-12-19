import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePick {
  static File? _selectedImage;
  static final ImagePicker _picker = ImagePicker();

  static Future<void> selectImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage = File(image.path);
    }
  }

  static Future<void> takePictureWithCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _selectedImage = File(image.path);
    }
  }

  static File? getSelectedImage() {
    return _selectedImage;
  }

  Future<File?> selectWithCamera() async {
        XFile? image = await _picker.pickImage(source: ImageSource.camera);
        return image != null ? File(image.path) : null;
  }
}
