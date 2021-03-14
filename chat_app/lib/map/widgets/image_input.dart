import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function(File) onSelectimage;

  const ImageInput({this.onSelectimage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  void _tackImage() async {
    final _imageFile = await ImagePicker().getImage(
        maxWidth: 600,
        source: Platform.isIOS ? ImageSource.gallery : ImageSource.camera);
    if (_imageFile == null) {
      return;
    }
    // save path image
    final appDirectory = await pathProvider.getApplicationDocumentsDirectory();
    final fileName = path.basename(_imageFile.path);
    final newImage =
        await File(_imageFile.path).copy('${appDirectory.path}/$fileName');
    widget.onSelectimage(newImage);

    setState(() {
      _storedImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No image'),
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton(
                onPressed: _tackImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Add image')
                  ],
                )))
      ],
    );
  }
}
