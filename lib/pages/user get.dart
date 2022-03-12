// ignore_for_file: unused_import

import 'package:ar_rajul/pages/merch.dart';
import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'admin.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Userget extends StatelessWidget {
  List merek =[];
  List FilteredMerek =[];
  TextEditingController searchController = TextEditingController();
  CollectionReference merk = firestore.collection("merk");
  @override

  
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(222, 234, 220, 1);
    const color2 = Color.fromRGBO(255, 255, 255, 1);
    return Scaffold(
        backgroundColor: color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(23, 100, 10, 40),
                      child: Container(
                        width: 500,
                        height: 70,
                        decoration: BoxDecoration(
                          color: color2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 12, 6, 6),
                          child: TextField(
                            controller: searchController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 13),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 40,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                      height: 100,
                      width: 375,
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
                                          alignment: Alignment.centerRight,
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
                                          height: 200,
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
                child: Container(
                  height: 800,
                  width: 1000,
                  child: FutureBuilder<QuerySnapshot<Object?>>(
                      future: Firebase_service().getData(),
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          var listAllData = snapshot.data!.docs;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: listAllData.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> data = listAllData[index]
                                    .data()! as Map<String, dynamic>;

                                return Center(
                                  child: Container(
                                    width: 500,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 70, 0, 0),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 12, 6, 6),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Container(
                                                  height: 280,
                                                  // padding: EdgeInsets.fromLTRB(20, 12, 6, 6),
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.black,
                                                      // border: Border.all(width: 8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                          fit: BoxFit.fitHeight,
                                                          image: NetworkImage(
                                                              data['gambar']
                                                                  .toString()))),
                                                ),
                                              ),
                                              Container(
                                                height: 280,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 60, 6, 6),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        data['namaGamis']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        "Rp ${data['harga']}",
                                                        style: const TextStyle(
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Text(
                                                        "Size : ${data['ukuran']}",
                                                        style: const TextStyle(
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Text(
                                                        "Diskon : ${data['promo']}",
                                                        style: const TextStyle(
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // leading: Image.network(data['gambar'].toString()),
                                  // title: Text(data['namaGamis'].toString()),
                                  // subtitle: Text(data['harga'].toString()),
                                );
                              });
                        }
                        return Container(
                          // ignore: unnecessary_const
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                            strokeWidth: 10,
                            backgroundColor: Colors.grey,
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
