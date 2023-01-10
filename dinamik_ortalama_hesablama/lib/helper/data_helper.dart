import 'package:dinamik_ortalama_hesablama/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];
  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalmaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    for (var element in tumEklenenDersler) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    }
    return toplamNot / toplamKredi;
  }

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
        return 2.5;
      case "CC":
        return 2;
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

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map(
          (e) => DropdownMenuItem(
            value: e.toDouble(),
            child: Text(
              e.toString(),
            ),
          ),
        )
        .toList();
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
