import 'package:dinamik_ortalama_hesablama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesablama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesablama/model/ders.dart';
import 'package:dinamik_ortalama_hesablama/ui/screens/ders_listesi.dart';
import 'package:dinamik_ortalama_hesablama/ui/screens/ortalama_goster_page.dart';
import 'package:dinamik_ortalama_hesablama/widget/harf_dropDown_widget.dart';
import 'package:dinamik_ortalama_hesablama/widget/kredi_dropDown_widget.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplamaPage extends StatefulWidget {
  const OrtalamaHesaplamaPage({super.key});

  @override
  State<OrtalamaHesaplamaPage> createState() => _OrtalamaHesaplamaPageState();
}

class _OrtalamaHesaplamaPageState extends State<OrtalamaHesaplamaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHerfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              Sabitler.baslikText,
              style: Sabitler.basliqStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      ortalama: DataHelper.ortalmaHesapla(),
                      dersSayisi: DataHelper.tumEklenenDersler.length),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                flex: 1,
                child: DersListesi(
                  onElemanCikarildi: (index) {
                    DataHelper.tumEklenenDersler.removeAt(index);
                    setState(() {});
                  },
                ))
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormFiled(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropDownWidget(
                    onHarfSecildi: (harf) {
                      secilenHerfDeger = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropDownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKrediDeger = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                  onPressed: _dersEkleveOrtalamaHesapla,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Sabitler.anaRenk,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormFiled() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          girilenDersAdi = value!;
        });
      },
      validator: ((s) {
        if (s!.isEmpty) {
          return "Ders adini giriniz";
        } else {
          return null;
        }
      }),
      decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHerfDeger,
          krediDegeri: secilenKrediDeger);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
