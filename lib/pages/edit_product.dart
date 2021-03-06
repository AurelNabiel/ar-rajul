// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, unused_import, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:ar_rajul/services/firebase_service.dart';

class EditPage extends StatefulWidget {
  final Map data;
  final String docId;
  const EditPage({required this.data, required this.docId});
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController gambar = TextEditingController();
  TextEditingController namaGamis = TextEditingController();
  TextEditingController merk = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController promo = TextEditingController();
  TextEditingController ukuran = TextEditingController();
  TextEditingController warna = TextEditingController();

  @override
  void initState() {
    gambar.text = widget.data['gambar'];
    namaGamis.text = widget.data['namaGamis'];
    harga.text = widget.data['harga'].toString();
    merk.text = widget.data['merk'];
    ukuran.text = widget.data['ukuran'];
    warna.text = widget.data['warna'];
    promo.text = widget.data['promo'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
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
                _form(
                  context,
                  gambar,
                  namaGamis,
                  harga,
                  merk,
                  warna,
                  ukuran,
                  promo,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 30),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Firebase_service().UpdateProduct(
                          widget.docId,
                          namaGamis.text,
                          int.parse(harga.text),
                          merk.text,
                          gambar.text,
                          promo.text,
                          ukuran.text,
                          warna.text,
                          context);
                    },
                    child: Text(
                      "Update",
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

Widget _form(BuildContext context, namaGamis, harga, merk, gambar, ukuran,
    warna, promo) {
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
      _field(context, "Merk", merk),
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
