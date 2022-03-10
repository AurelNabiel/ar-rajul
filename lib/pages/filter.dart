import 'package:ar_rajul/config.dart';
import 'package:flutter/material.dart';

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
            padding: EdgeInsets.all(10),
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
                  Column(
                    
                    children: [
                      
                      Card(
                        
                          elevation: 20,
                          color: daws6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                  width: 250,
                                  height: 100,
                                  child: Center(
                                    child: Text('Black',
                                        style: TextStyle(fontSize: 50)),
                                  )),
                              Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: const BoxDecoration(
                                          // The child of a round Card should be in round shape
                                          shape: BoxShape.circle,
                                          color: Colors.black))),
                            ],
                          )),
                      Card(
                          elevation: 20,
                          color: daws6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SizedBox(
                            width: 350,
                            height: 100,
                            child: Center(
                                child: Text('White',
                                    style: TextStyle(fontSize: 50))),
                          )),
                      Card(
                          elevation: 20,
                          color: daws6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SizedBox(
                            width: 350,
                            height: 100,
                            child: Center(
                                child: Text('Blue',
                                    style: TextStyle(fontSize: 50))),
                          )),
                    ],
                  )
                ],
              ),
            )));
  }
}
