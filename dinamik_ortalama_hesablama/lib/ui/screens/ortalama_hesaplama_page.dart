import 'package:dinamik_ortalama_hesablama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesablama/ui/screens/ortalama_goster_page.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplamaPage extends StatefulWidget {
  const OrtalamaHesaplamaPage({super.key});

  @override
  State<OrtalamaHesaplamaPage> createState() => _OrtalamaHesaplamaPageState();
}

class _OrtalamaHesaplamaPageState extends State<OrtalamaHesaplamaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Expanded(
                  flex: 1,
                  child: OrtalamaGoster(ortalama: 2.522, dersSayisi: 1),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                child: const Text("blue"),
              ),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormFiled(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.wind_power)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.wind_power)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.wind_power)),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormFiled() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }
}
