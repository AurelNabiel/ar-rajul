import 'package:ar_rajul/config.dart';
import 'package:ar_rajul/pages/add_product.dart';
import 'package:ar_rajul/pages/search.dart';
import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'edit_product.dart';

class Admin extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ar-Rajul"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 960,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 10, 10, 10),
                child: Container(
                  width: 500,
                  height: 70,
                  decoration: BoxDecoration(
                    color: daws6,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 12, 6, 6),
                    child: TextField(
                      onSubmitted: ((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search(search: value)))),
                      controller: searchController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 13),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 40,
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                height: 870,
                child: StreamBuilder<QuerySnapshot<Object?>>(
                    stream: Firebase_service().streamData(),
                    builder: (context, snapshot) {
                      // ignore: avoid_print
                      print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.active) {
                        var listAllData = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: listAllData.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data = listAllData[index]
                                .data()! as Map<String, dynamic>;

                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color: daws, blurRadius: 3.0),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Container(
                                              height: 280,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 6.0,
                                                      color:
                                                          const Color.fromARGB(
                                                              0, 69, 9, 211)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          data['gambar']
                                                              .toString()))),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    data["namaGamis"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Rp : ${data["harga"]}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    "Color : ${data["warna"]} ",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    "Size : ${data['ukuran']}",
                                                    style: const TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          Alert(
                                                            context: context,
                                                            type:
                                                                AlertType.info,
                                                            title:
                                                                "Delete Product",
                                                            desc:
                                                                "do you really want to delete this Products?",
                                                            buttons: [
                                                              DialogButton(
                                                                child:
                                                                    const Text(
                                                                  "Nope",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                width: 120,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              DialogButton(
                                                                child:
                                                                    const Text(
                                                                  "Yup",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  Firebase_service().DeleteProduct(
                                                                      listAllData[
                                                                              index]
                                                                          .id,
                                                                      context);
                                                                },
                                                                width: 120,
                                                                color:
                                                                    Colors.blue,
                                                              )
                                                            ],
                                                          ).show();
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          size: 35,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (context) => EditPage(
                                                                      data:
                                                                          data,
                                                                      docId: listAllData[
                                                                              index]
                                                                          .id)));
                                                        },
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          size: 35,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                          strokeWidth: 10,
                          backgroundColor: Colors.grey,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
