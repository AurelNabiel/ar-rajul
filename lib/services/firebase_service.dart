// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class Firebase_service {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference gamis = firestore.collection("gamis");

    return await gamis.get();
  }
  Future<QuerySnapshot<Object?>> getData2() async {
    CollectionReference merk = firestore.collection("merk");
    return await merk.get();
  }

  // getGamis() async {
  //   var response = await firestore.collection('gamis');
  //   return response.get();
  // }


  void addProduct(String namaGamis, int harga, String merk, String gambar,
      String promo, String ukuran, String warna, context) async {
    CollectionReference gamis = firestore.collection("gamis");
    int count = 0;

    try {
      await gamis.add({
        "namaGamis": namaGamis,
        "harga": harga,
        "merk": merk,
        "gambar": gambar,
        "promo": promo,
        "ukuran": ukuran,
        "warna": warna
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
    // ignore: unused_local_variable
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

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference gamis = firestore.collection("gamis");
    return gamis.snapshots();
  }

  void UpdateProduct(String docId, String namaGamis, int harga, String merk,
      String gambar, String promo, String ukuran, String warna, context) async {
    DocumentReference gamis = firestore.collection("gamis").doc(docId);
    int count = 0;

    try {
      await gamis.update({
        "namaGamis": namaGamis,
        "harga": harga,
        "merk": merk,
        "gambar": gambar,
        "promo": promo,
        "ukuran": ukuran,
        "warna": warna
      });
      Alert(
        context: context,
        type: AlertType.success,
        title: "Success",
        desc: "congratulations your data Product have been Updated",
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

  void filterSamase() async {
    CollectionReference merk = firestore.collection("gamis");
    final result = await firestore
        .collection('merk')
        .where('namaGamis', isEqualTo: 'bekasi')
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

  void filterRabbani() async {
    CollectionReference merk = firestore.collection("gamis");
    final result = await firestore
        .collection('merk')
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

  void filterXabit() async {
    CollectionReference merk = firestore.collection("gamis");
    final result = await firestore
        .collection('merk')
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

  void filterHamd() async {
    CollectionReference merk = firestore.collection("gamis");
    final result = await firestore
        .collection('merk')
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
