// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.amber,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.edit),
          label: Text("Add Profile Photo"),
        ),
      ],
    );
  }
}
