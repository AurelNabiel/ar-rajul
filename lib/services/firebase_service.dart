// ignore_for_file: camel_case_types
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Firebase_service {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String namaGamis, int harga, String gambar, String promo,
      String ukuran, String warna, context) async {
    CollectionReference gamis = firestore.collection("gamis");
    int count = 0;

    try {
      await gamis.add({
        "nama": namaGamis,
        "harga": harga,
        "foto": gambar,
        "promo": promo,
        "size": ukuran,
        "color": warna
      });
      Alert(
        context: context,
        type: AlertType.success,
        title: "Success",
        desc: "congratulations your data Product have been added",
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.popUntil(context, (route) {
              return count++ == 2;
            }),
            width: 120,
          )
        ],
      ).show();
    } catch (e) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Something Wrong",
        desc: "Their is something Wrong $e",
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }

  void DeleteProduct(String docId, context) async {
    DocumentReference gamis = firestore.collection("gamis").doc(docId);
    int count = 0;

    try {
      await gamis.delete();
      Alert(
        context: context,
        type: AlertType.success,
        title: "Success",
        desc: "congratulations your data Product have been Deleted",
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(
              context,
            ),
            width: 120,
          )
        ],
      ).show();
    } catch (e) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Something Wrong",
        desc: "Their is something Wrong $e",
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }

  void filterData() async {
    final result = await firestore
        .collection('users')
        .where('domisili', isEqualTo: 'bekasi')
        .where('umur', isLessThan: 20)
        .where('hobi', isEqualTo: 'basket')
        .get();
    // print(result.docs.length);
    if (result.docs.length > 0) {
      log('Data Yang Terfilter Ada : ${result.docs.length.toString()}');
      result.docs.forEach((element) {
        log('ID : ${element.id}');
        log('DATA : ${element.data()}');
      });
    } else
      log('Data Tidak Ada');
  }
}
