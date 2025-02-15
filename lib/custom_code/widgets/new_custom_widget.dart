// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/*

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  XFile? _image;

  // Function to pick an image
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image != null
            ? Image.file(
                File(_image!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            : Container(
                height: 200,
                width: 200,
                color: Colors.grey[200],
                child: Icon(
                  Icons.image,
                  color: Colors.grey[600],
                  size: 50,
                ),
              ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Pick Image'),
        ),
      ],
    );
  }
}
*/
