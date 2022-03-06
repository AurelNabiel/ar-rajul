// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:latihan_firebase/services/firebase_service.dart';

class EditPage extends StatefulWidget {
  final Map data;
  final String docId;
  const EditPage({required this.data, required this.docId});
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  @override
  void initState() {
    productName.text = widget.data['nama'];
    productPrice.text = widget.data['harga'].toString();
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
                _form(context, productName, productPrice),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 30),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Firebase_service().UpdateProduct(
                          widget.docId,
                          productName.text,
                          int.parse(productPrice.text),
                          context);
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: lebar >= 800 ? 30 : 30),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],
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

Widget _form(BuildContext context, productName, productPrice) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _field(context, "Nama Product", productName),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      _field(context, "Harga", productPrice),
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
