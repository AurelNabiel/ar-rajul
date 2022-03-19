import 'package:ar_rajul/config.dart';
import 'package:ar_rajul/pages/search.dart';

import 'package:ar_rajul/pages/user%20get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class searchPage extends StatelessWidget {
  CollectionReference gamis = firestore.collection("gamis");
  late QuerySnapshot snapshotData;
  bool isExsecuted = false;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(snapshotData.docs[index]['gambar'].toString()),
              ),
              title: Text(
                snapshotData.docs[index]["namaGamis"].toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
              subtitle: Text(
                snapshotData.docs[index]["merk"],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            );
          });
    }

    return Scaffold(

        // appBar: AppBar(
        //   actions: [
        //     GetBuilder<DataController>(
        //         init: DataController(),
        //         builder: (val) {
        //           return IconButton(
        //               icon: const Icon(Icons.search),
        //               onPressed: () {
        //                 val.queryData(searchController.text).then((value) {
        //                   snapshotData = value;
        //                   setState(() {
        //                     isExsecuted = true;
        //                   });
        //                 });
        //               });
        //         }),
        //     Padding(
        //             padding: const EdgeInsets.fromLTRB(6, 12, 6, 6),
        //             child: TextField(
        //               onSubmitted: ((value) => Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => Search(search: value)))),
        //               controller: searchController,
        //               decoration: const InputDecoration(
        //                   border: InputBorder.none,
        //                   hintText: 'Search',
        //                   labelStyle:
        //                       TextStyle(color: Colors.black, fontSize: 13),
        //                   prefixIcon: Icon(
        //                     Icons.search,
        //                     size: 40,
        //                   )),
        //             ),
        //           ),
        //   ],
        //   title: TextField(
        //     style: TextStyle(color: daws6),
        //     decoration: InputDecoration(
        //       hintText: "Search Gamis",
        //       hintStyle: TextStyle(color: daws6),
        //     ),
        //     controller: searchController,
        //   ),
        //   backgroundColor: daws,
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Userget()));
          },
          backgroundColor: daws,
          child: const Icon(Icons.dangerous),
        ),
        backgroundColor: daws6,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/ar-rajul.appspot.com/o/Android%20Small%20-%202.png?alt=media&token=37ea04c8-4866-4702-8d63-5e24b35ea850"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: const Image(
                  image: AssetImage("assets/images/Group 12.png"),
                  height: 250,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 200),
                  child: Container(
                    width: 500,
                    height: 70,
                    decoration: BoxDecoration(
                      color: daws4,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(6, 12, 6, 6),
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
