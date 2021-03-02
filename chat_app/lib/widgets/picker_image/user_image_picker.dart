import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File) imagePicker;
  UserImagePicker({this.imagePicker});
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _file;
  void _imagePicker() async {
    final file =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(file.path);
    });
    widget.imagePicker(_file);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: _file != null ? FileImage(_file) : null,
          radius: 40,
        ),
        TextButton.icon(
            onPressed: _imagePicker,
            icon: Icon(Icons.image),
            label: Text('Add image'))
      ],
    );
  }
}
