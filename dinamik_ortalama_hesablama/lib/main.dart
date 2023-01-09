import 'package:dinamik_ortalama_hesablama/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'ui/screens/ortalama_hesaplama_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik ortalama hesablama',
      theme: ThemeData(primaryColor: Sabitler.anaRenk),
      home: const OrtalamaHesaplamaPage(),
    );
  }
}
