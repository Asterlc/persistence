import 'package:flutter/material.dart';
import 'package:persistence/screens/place_form_screen.dart';
import 'package:persistence/screens/place_list_screen.dart';
import 'package:persistence/util/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber)),
      home: PlaceListWidget(),
      routes: {
        AppRoutes.PLACE_FORM: (ctx) => const PlaceFormWidget(),
      },
    );
  }
}
