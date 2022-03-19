// ignore_for_file: unused_import, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ar_rajul/config.dart';
import 'package:ar_rajul/pages/search.dart';
import 'package:ar_rajul/pages/merch.dart';

import 'package:ar_rajul/pages/searchPage.dart';
import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Userget extends StatelessWidget {
  List merek = [];
  List FilteredMerek = [];
  CollectionReference merk = firestore.collection("merk");
  CollectionReference gamis = firestore.collection("gamis");
  TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;
  bool isExsecuted = false;

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(222, 234, 220, 1);
    const color2 = Color.fromRGBO(255, 255, 255, 1);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => searchPage()));
          },
          backgroundColor: daws,
          child: Icon(Icons.search),
        ),
        backgroundColor: daws4,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 6, 6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 280,
                          width: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/banner.png'))),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    // padding:  EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 400,
                      child: FutureBuilder<QuerySnapshot<Object?>>(
                          future: Firebase_service().getData2(),
                          // ignore: missing_return
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var listAllData = snapshot.data!.docs;
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> data =
                                        listAllData[index].data()!
                                            as Map<String, dynamic>;
                                    return Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Merch()));
                                                },
                                                child: Image.network(
                                                    data['gambar'].toString()),
                                              )),
                                          height: 100,
                                          width: 100,
                                        ),
                                      ],
                                    );
                                  });
                            }
                            return Container(
                              alignment: Alignment.center,
                              // ignore: unnecessary_const
                              child: const CircularProgressIndicator(),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(52, 0, 0, 0),
                        child: Container(
                          child: const Text(
                            'Selected for you',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                child: Wrap(
                    alignment: WrapAlignment.center,
                    // spacing: 10,
                    direction: Axis.vertical,
                    children: [
                      
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 3000,
                        width: 400,
                        child: FutureBuilder<QuerySnapshot<Object?>>(
                            future: Firebase_service().getData(), // mendapa
                            // ignore: missing_return
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var listAllData = snapshot.data!
                                    .docs; // untuk mengambil data dari firebase dengan menggunakan snapshot data
                                return GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2 ,mainAxisSpacing: 250),
                                    scrollDirection: Axis
                                        .vertical, // untuk membuat listview dalam bentuk vertikal
                                    itemCount: listAllData
                                        .length, // untuk menghitung jumlah data yang ada
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          listAllData[index].data()!
                                              as Map<String, dynamic>; //

                                      return Wrap(children: [
                                        
                                        Container(
                                          alignment: Alignment.center,
                                          width: 200,
                                          // padding: const EdgeInsets.fromLTRB(
                                          //     20, 50, 0, 0),
                                          // child: Padding(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       0, 70, 0, 0),
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 30, 0, 0),
                                                child: Wrap(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Container(
                                                        height: 150,
                                                        width: 150,
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 30, 0, 0),
                                                        
                                                        decoration:
                                                            BoxDecoration(
                                                                // color: Colors.black,
                                                                // border: Border.all(width: 8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                    image: NetworkImage(
                                                                        data['gambar']
                                                                            .toString()))),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      child: Card(
                                                        color: daws4,
                                                        child: Text(
                                                          "${data['promo']}",
                                                          style: const TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 150,
                                                      width: 200,
                                                      decoration:
                                                          BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 10, 0, 0),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              data['namaGamis']
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Text(
                                                              "Rp ${data['harga']}",
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                            Text(
                                                              "Size : ${data['ukuran']}",
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          // ),
                                        ),
                                      ]);
                                    });
                              } // untuk
                              return Container(
                                // ignore: unnecessary_const
                                child: const CircularProgressIndicator(),
                              );
                            }),
                      ),
                      
                    ]),
              ),
            ],
          ),
        ));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<QuerySnapshot<Object?>>(
        'snapshotData', snapshotData));
  }
}

void setState(Null Function() param0) {}
