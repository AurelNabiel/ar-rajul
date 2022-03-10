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
                          // padding: EdgeInsets.fromLTRB(20, 12, 6, 6),
                          width: 500,
                          decoration: BoxDecoration(
                              // color: Colors.black,
                              // border: Border.all(width: 8),
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/123.jpg'))),
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 40),
                  Container(
                    width: 1000,
                    height: 100,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(51, 12, 6, 6),
                        child: ListView(
                           scrollDirection: Axis.horizontal,
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
                                    image: AssetImage('assets/images/78.png'),
                                  ),
                                ),
                              ),
                            ),
                    
                    
                            Padding(
                              padding: const EdgeInsets.fromLTRB(52, 0, 0, 0),
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
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/90.png'))),
                                ),
                              ),
                            ),
                    
                    
                    
                            Padding(
                              padding: const EdgeInsets.fromLTRB(52, 0, 0, 0),
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
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/456.png'))),
                                ),
                              ),
                            ),
                    
                    
                    
                            Padding(
                              padding: const EdgeInsets.fromLTRB(52, 0, 0, 0),
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
                                      borderRadius: BorderRadius.circular(20),
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
                                          padding: const EdgeInsets.fromLTRB(  10, 12, 6, 6),
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
                                                      const EdgeInsets.fromLTRB( 10, 60, 6, 6),
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
                                                        data['harga']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(height: 40),
                                                      Text(
                                                        data['ukuran']
                                                            .toString(),
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
                          child: const CircularProgressIndicator(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
