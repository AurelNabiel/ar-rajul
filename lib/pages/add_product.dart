// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:ar_rajul/services/firebase_service.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController namaGamis = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController gambar = TextEditingController();
  TextEditingController promo = TextEditingController();
  TextEditingController ukuran = TextEditingController();
  TextEditingController warna = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: SafeArea(
          child: Padding(
        padding: lebar >= 800
            ? EdgeInsets.symmetric(vertical: 20, horizontal: 40)
            : EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _form(context, namaGamis, harga, ukuran, warna, promo, gambar),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 30),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Firebase_service().addProduct(
                          namaGamis.text,
                          int.parse(harga.text),
                          gambar.text,
                          promo.text,
                          ukuran.text,
                          warna.text,
                          context);
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(fontSize: lebar >= 800 ? 30 : 30),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50)),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget _form(
    BuildContext context, namaGamis, harga, ukuran, warna, promo, gambar) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _field(context, "gambar Gamis", gambar),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      _field(context, "Nama Gamis", namaGamis),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      _field(context, "Harga", harga),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      _field(context, "Size", ukuran),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      _field(context, "Color", warna),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      _field(context, "Promo", promo),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
    ],
  );
}

Widget _field(BuildContext context, String text, controller) {
  final lebar = MediaQuery.of(context).size.width;
  return TextField(
    controller: controller,
    style: TextStyle(color: Colors.black, fontSize: 20),
    decoration: InputDecoration(
        contentPadding: lebar >= 800
            ? EdgeInsets.symmetric(vertical: 25, horizontal: 20)
            : EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey[600])),
  );
}
