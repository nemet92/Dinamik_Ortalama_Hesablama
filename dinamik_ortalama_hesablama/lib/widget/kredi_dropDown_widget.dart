import 'package:dinamik_ortalama_hesablama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesablama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropDownWidget extends StatefulWidget {
  final onKrediSecildi;
  const KrediDropDownWidget({super.key, required this.onKrediSecildi});

  @override
  State<KrediDropDownWidget> createState() => _KrediDropDownWidgetState();
}

double secilenKrediDeger = 1;

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: Sabitler.dropDownPadding,
        decoration: BoxDecoration(
            color: Sabitler.anaRenk.shade100.withOpacity(0.3),
            borderRadius: Sabitler.borderRadius),
        child: DropdownButton<double>(
            elevation: 0,
            iconEnabledColor: Sabitler.anaRenk.shade200,
            underline: Container(),
            onChanged: ((value) {
              setState(() {
                secilenKrediDeger = value!;
                widget.onKrediSecildi(value);
              });
            }),
            value: secilenKrediDeger,
            items: DataHelper.tumDerslerinKredileri()));
  }
}
