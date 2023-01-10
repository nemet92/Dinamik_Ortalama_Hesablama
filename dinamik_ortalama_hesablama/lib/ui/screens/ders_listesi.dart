import 'package:dinamik_ortalama_hesablama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesablama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesablama/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({
    super.key,
    required this.onElemanCikarildi,
  });

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                direction: DismissDirection.endToStart,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Sabitler.anaRenk,
                          child: Text((tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0))),
                      title: Text(
                        tumDersler[index].ad,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi,Not Degeri ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                "Lutfen Ders Ekleyin",
                style: Sabitler.basliqStyle,
              ),
            ),
          );
  }
}
