import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class Merch extends StatelessWidget {
  const Merch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Merch"),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: Firebase_service().streamData(),
          builder: (context, snapshot) {
            // ignore: avoid_print
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllData = snapshot.data!.docs;
              return ListView.builder(
                itemCount: listAllData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      listAllData[index].data()! as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: 240,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25.0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: daws, blurRadius: 10.0),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    height: 280,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 6.0,
                                            color: const Color.fromARGB(
                                                0, 69, 9, 211)),
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                data['gambar'].toString()))),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 100,
                                          ),
                                          Text(
                                            data["merk"].toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        )),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                strokeWidth: 10,
                backgroundColor: Colors.grey,
              ),
            );
          }),
    );
  }
}
