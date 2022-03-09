import 'package:ar_rajul/pages/add_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/firebase_service.dart';
import 'edit_product.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ar-Rajul"),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: Firebase_service().streamData(),
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllData = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: listAllData.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data =
                        listAllData[index].data()! as Map<String, dynamic>;
                    return ListTile(
                      leading: Image.network(data["gambar"].toString()),
                      title: Text(data["nama"].toString()),
                      subtitle: Text(data['harga'].toString()),
                      trailing: IconButton(
                        onPressed: () {
                          Alert(
                            context: context,
                            type: AlertType.info,
                            title: "Delete Product",
                            desc: "do you really want to delete this Products?",
                            buttons: [
                              DialogButton(
                                child: const Text(
                                  "Nope",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                                color: Colors.red,
                              ),
                              DialogButton(
                                child: const Text(
                                  "Yup",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Firebase_service().DeleteProduct(
                                      listAllData[index].id, context);
                                },
                                width: 120,
                                color: Colors.blue,
                              )
                            ],
                          ).show();
                          ;
                        },
                        icon: Icon(Icons.delete),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditPage(
                                data: data, docId: listAllData[index].id)));
                      },
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
