import 'dart:io';

import 'package:esthelogy_project/screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadImage extends StatefulWidget {
  final String title;
  final String image;

  const UploadImage({super.key, required this.title, required this.image});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _takePictureWithCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    print('\n\n\n hello world');
    print(active);
    print('\n\n\n hello world');
    if(_selectedImage!=null){
      active.value--;
    }

    if (image != null) {
      setState(() {
        active.value++;
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _takePictureWithCamera();
      },
      child: Container(
        height: 80,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
            color: Colors.purple.shade50
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,style: TextStyle(fontSize: 22,color:Colors.black),),
              if (_selectedImage != null)
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Image.file(
                            File(_selectedImage!.path),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        );
                      },
                    );
                  },
                  child: Image.file(
                    File(_selectedImage!.path),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,

                  ),
                ),
            ],
          )),
    );
  }
}
