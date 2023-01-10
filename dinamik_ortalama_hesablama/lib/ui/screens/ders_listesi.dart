import 'package:dinamik_ortalama_hesablama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesablama/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  const DersListesi({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return ListView.builder(
        itemCount: tumDersler.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                tumDersler[index].ad,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        });
  }
}
