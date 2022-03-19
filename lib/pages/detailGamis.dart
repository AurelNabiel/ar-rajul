// ignore_for_file: unused_import, deprecated_member_use

import 'package:ar_rajul/pages/search.dart';
import 'package:ar_rajul/pages/merch.dart';
import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unnecessary_import
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'admin.dart';

class DetailPage extends StatefulWidget {
  final Map data;
  DetailPage({required this.data});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1400,
          width: 800,
          child: FutureBuilder<QuerySnapshot<Object?>>(
              future: Firebase_service().getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var listAllData = snapshot.data!.docs;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data =
                          listAllData[index].data()! as Map<String, dynamic>; //

                      return Stack(
                        children: <Widget>[
                          Container(
                            height: height * 0.55,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      widget.data['gambar'].toString()))),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.black.withOpacity(0.9),
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.9),
                                  ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                            ),
                          ),
                          Container(
                            height: 700,
                            margin: EdgeInsets.only(top: height * 0.5),
                            padding: const EdgeInsets.all(30),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                 widget. data['namaGamis'].toString(),
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 50,
                                  width: width,
                                  child: ListView.builder(
                                    itemCount: listAllData.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.yellow[900],
                                        size: 34,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Merk",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Size : ${widget.data['ukuran']}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.5,
                                      wordSpacing: 1.5),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Price",
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Rp ${widget.data['harga']}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    RaisedButton(
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.orange[800],
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 15, 35, 15),
                                      child: const Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 30,
                            top: height * 0.05,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.keyboard_backspace,
                                size: 42,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            top: height * 0.45,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _like = !_like;
                                });
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 5,
                                          spreadRadius: 1)
                                    ]),
                                child: Icon(
                                  Icons.favorite,
                                  size: 45,
                                  color:
                                      (_like) ? Colors.red : Colors.grey[600],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
                return Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
