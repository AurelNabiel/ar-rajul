import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:[  FutureBuilder<QuerySnapshot<Object?>>(
          future: Firebase_service().getData(),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var listAllData = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: listAllData.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data =
                        listAllData[index].data()! as Map<String, dynamic>;
                    return ListTile(
                      leading: Image.network(data['gambar']),
                      title: Text(data['namaGamis']),
                      subtitle: Text(data['harga'].toString()),
                    );
                  });
            }
            return Container(
              alignment: Alignment.center,
              // ignore: unnecessary_const
              child: const CircularProgressIndicator(),
            );
          }),]
      )
    );
  }
}
