import 'package:flutter/material.dart';
import 'package:racemate/features/main_view/views/main_view.dart';

import 'gen/fonts.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.roboto,
        useMaterial3: false,
      ),
      home: const MainView(),
    );
  }
}