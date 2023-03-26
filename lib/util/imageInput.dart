import 'package:flutter/material.dart';

class ImageInputWidget extends StatefulWidget {
  const ImageInputWidget({Key? key}) : super(key: key);

  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
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
          child: const Text("Nenhuma imagem"),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.camera),
          label: const Text("Tirar foto"),
        )),
      ],
    );
  }
}
