import 'package:flutter/material.dart';
import 'package:persistence/util/imageInput.dart';

class PlaceFormWidget extends StatefulWidget {
  const PlaceFormWidget({Key? key}) : super(key: key);

  @override
  State<PlaceFormWidget> createState() => _PlaceFormWidgetState();
}

class _PlaceFormWidgetState extends State<PlaceFormWidget> {
  final _titleController = TextEditingController();

  void _onSubmit() {}

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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: const <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                      SizedBox(height: 10),
                      ImageInputWidget()
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
