// ignore_for_file: unused_import

import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Userget extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(222, 234, 220, 1);
    const color2 = Color.fromRGBO(255, 255, 255, 1);
    return Scaffold(
        backgroundColor: color,
        body: Column(
          children: [
            FutureBuilder<QuerySnapshot<Object?>>(
                future: Firebase_service().getData(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var listAllData = snapshot.data!.docs;

                    // return Padding(
                    //   //agar ke tengah

                    //   padding: const EdgeInsets.fromLTRB(45, 100, 10, 10),
                    return Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(23, 100, 10, 25),
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
                                // padding: EdgeInsets.fromLTRB(20, 12, 6, 6),
                                width: 500,
                                decoration: BoxDecoration(
                                    // color: Colors.black,
                                    // border: Border.all(width: 8),
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/123.jpg'))),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(51, 12, 6, 6),
                            child: Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                      // border: Border.all(width: 8),
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage('assets/images/456.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(52, 0, 0, 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          // color: Colors.black,
                                          // border: Border.all(width: 8),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/456.png'))),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(52, 0, 0, 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          // color: Colors.black,
                                          // border: Border.all(width: 8),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/456.png'))),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(52, 0, 0, 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          // color: Colors.black,
                                          // border: Border.all(width: 8),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/456.png'))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          itemCount: listAllData.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data = listAllData[index]
                                .data()! as Map<String, dynamic>;
                             ListTile(
                              leading: Image.network(data['gambar'].toString()),
                              title: Text(data['namaGamis'].toString()),
                              subtitle: Text(data['harga'].toString()),
                            );
                          },
                        )
                      ],
                    );
                  }
                  return Container(
                    // ignore: unnecessary_const
                    child: const CircularProgressIndicator(),
                  );
                }),
          ],
        ));
  }
}
