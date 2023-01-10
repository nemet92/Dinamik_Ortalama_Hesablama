import 'package:dinamik_ortalama_hesablama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesablama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

double secilenHerfDeger = 4;

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
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
                secilenHerfDeger = value!;
                widget.onHarfSecildi(secilenHerfDeger);
              });
            }),
            value: secilenHerfDeger,
            items: DataHelper.tumDerslerinHarfleri()));
  }
}
