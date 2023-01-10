import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _tumDerslerinHarifleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harifiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;

      case "CB":
        return 6;
      case "CC":
        return 3.7;
      case "DC":
        return 8.5;
      case "DD":
        return 7.0;

      case "FD":
        return 6;

      case "F":
        return 5;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarifleri()
        .map((e) => DropdownMenuItem(
              value: _harifiNotaCevir(e),
              child: Text(e),
            ))
        .toList();
  }
}
