// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPaths;

import 'package:whatsapp_clone/utils/app_theme.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;

  UserImagePicker(this.imagePickFn);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    final pickedImageFile = File(pickedImage!.path);

    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppTheme.chipBackground,
          backgroundImage: _pickedImage != null
              ? FileImage(_pickedImage!)
              : Image.asset('assets/images/default.png').image,
        ),
        if (_pickedImage == null)
          TextButton.icon(
            onPressed: _pickImage,
            icon: Icon(
              Icons.add_a_photo,
              color: AppTheme.nearlyWhite,
            ),
            label: Text(
              'Add Profile Photo',
              style: TextStyle(color: AppTheme.nearlyWhite),
            ),
          ),
      ],
    );
  }
}
