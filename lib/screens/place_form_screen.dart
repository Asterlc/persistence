import 'dart:io';

import 'package:flutter/material.dart';
import 'package:persistence/util/imageInput.dart';

class PlaceFormWidget extends StatefulWidget {
  const PlaceFormWidget({Key? key}) : super(key: key);

  @override
  State<PlaceFormWidget> createState() => _PlaceFormWidgetState();
}

class _PlaceFormWidgetState extends State<PlaceFormWidget> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
      _pickedImage = pickedImage;
  }

  void _onSubmit() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Novo lugar"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 2),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ImageInputWidget(onSelectedImage: _selectImage),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _onSubmit,
              icon: const Icon(Icons.add),
              label: const Text("Adicionar"),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 50),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
