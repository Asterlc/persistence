import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


class ImageInputWidget extends StatefulWidget {
  final Function onSelectedImage;

  ImageInputWidget({required this.onSelectedImage});

  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? _storedImage;

  _takePicture() async {
    final ImagePicker picker = ImagePicker();
    XFile imageFile = await picker.pickImage(
        source: ImageSource.camera, maxWidth: 600, maxHeight: 300) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    if(_storedImage != null){
      File helper = _storedImage as File;
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      String fileName = path.basename(helper.path);
      final savedImage = await helper.copy("${appDir.path}/$fileName");

      widget.onSelectedImage(savedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage as File,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text("Nenhuma imagem"),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera),
          label: const Text("Tirar foto"),
        )),
      ],
    );
  }
}
