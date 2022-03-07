import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'edit_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //     future: Firebase_service().getData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         var listAllData = snapshot.data!.docs;
      //         return ListView.builder(
      //             itemCount: listAllData.length,
      //             itemBuilder: (context, index) {
      //               Map<String, dynamic> data =
      //                   listAllData[index].data()! as Map<String, dynamic>;
      //               return ListTile(
      //                 title: Text(data["nama"].toString()),
      //                 subtitle: Text(data['harga'].toString()),
      //               );
      //             });
      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }),
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
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
