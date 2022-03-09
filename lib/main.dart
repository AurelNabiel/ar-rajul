// ignore: avoid_web_libraries_in_flutter, unused_import

import 'package:ar_rajul/pages/admin.dart';
import 'package:ar_rajul/pages/user.dart';
import 'package:ar_rajul/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ar_rajul/config.dart';

import 'pages/edit_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const User(),
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
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/ar-rajul.appspot.com/o/adminUser.png?alt=media&token=6f9b36f1-e634-4dec-89ae-de4e4f436e90'),
                    fit: BoxFit.cover)),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const DecoratedBox(decoration: BoxDecoration()),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(daws2),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const DecoratedBox(decoration: BoxDecoration()),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(daws2),
                  ),
                ),
              ],
            )));
  }
}
