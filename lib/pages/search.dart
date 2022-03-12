import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final String search;
  Search({required this.search});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> gamis = FirebaseFirestore.instance
        .collection("gamis")
        .snapshots();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: gamis,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllData = snapshot.data!.docs;

              var data1 = listAllData
                  .where((element) =>
                      element["namaGamis"].toString().toLowerCase().contains(widget.search))
                  .toList();
              print(data1.length);
              return SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Search: ${widget.search}",
                        style: TextStyle(
                            fontSize: width / 13, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                      Container(
                        height: height,
                        width: width,
                        child: ListView.builder(
                          itemCount: data1.length,
                          itemBuilder: (context, i) {
                            Map<String, dynamic> data =
                                data1[i].data()! as Map<String, dynamic>;
                            return _data(height, width, data);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget _data(height, width, data) {
  return Container(
    margin: EdgeInsets.only(bottom: 40),
    height: height / 5,
    width: width,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 223, 223, 223),
        borderRadius: BorderRadius.circular(24)),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            margin: EdgeInsets.only(bottom: 20),
            height: height,
            width: width / 2.9,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data["gambar"].toString()),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            width: width / 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['namaGamis'].toString(),
                style: TextStyle(
                    fontSize: width / 27, fontWeight: FontWeight.w700),
              ),
              Text(
                "Rp ${data["harga"].toString()}",
                style: TextStyle(fontSize: width / 35),
              ),
              Text(
                "${data["ukuran"].toString()}, ${data["promo"].toString()}%",
                style: TextStyle(fontSize: width / 35),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
