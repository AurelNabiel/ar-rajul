import 'package:ar_rajul/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   final menuButton =  PopupMenuButton<int>(
    //   onSelected: (int i) {},
    //   itemBuilder: (BuildContext ctx){},
    //   child:  const Icon(
    //     Icons.dashboard,
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Filter',
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {},
          ),
          // actions: [
          //   menuButton,
          // ],
        ),
        body: Container(
          
            decoration: BoxDecoration(color: daws6),
            padding: EdgeInsets.all(35),
            child: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables

                children: [
                  const Text(
                    "Prices",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, height: 5, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: SizedBox(
                            width: 130,
                            height: 90,
                            child: Center(
                                child: Text('Murah',
                                    style: TextStyle(fontSize: 25))),
                          )),
                      const Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: SizedBox(
                            width: 110,
                            height: 90,
                            child: Center(
                                child: Text('Sedang',
                                    style: TextStyle(fontSize: 25))),
                          )),
                      const Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: SizedBox(
                            width: 110,
                            height: 90,
                            child: Center(
                                child: Text('Mahal',
                                    style: TextStyle(fontSize: 25))),
                          ))
                    ],
                  ),
                  const Text(
                    "Color",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, height: 5, fontSize: 20),
                  ),
                  Container(
                    height: 400,
                    child: FutureBuilder<QuerySnapshot<Object?>>(
                        future: Firebase_service().getData(),
                        // ignore: missing_return
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            var listAllData = snapshot.data!.docs;
                            return ListView.builder(
                                itemCount: listAllData.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> data = listAllData[index]
                                      .data()! as Map<String, dynamic>;
                                  return Card(
                                    elevation: 20,
                                    color: daws6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(data['warna'],
                                        style: TextStyle(fontSize: 50)),
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
                  const Text(
                    "Size",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, height: 5, fontSize: 20),
                  ),
                  Container(
                    height: 400,
                    width: 300,
                    child: FutureBuilder<QuerySnapshot<Object?>>(
                        future: Firebase_service().getData(),
                        // ignore: missing_return
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            var listAllData = snapshot.data!.docs;
                            return ListView.builder(
                                itemCount: listAllData.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> data = listAllData[index]
                                      .data()! as Map<String, dynamic>;
                                  return Card(
                                    
                                    elevation: 20,
                                    color: daws6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(data['ukuran'],
                                        style: TextStyle(fontSize: 50)),
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
                ],
              ),
            )));
  }
}
