// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// // ignore: must_be_immutable
// class SearchPage extends StatefulWidget {
//   late String keyword;

//   SearchPage({required this.keyword});

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List<RestaurantElement> data = [];
//   Future readData() async {
//     final response = await rootBundle.loadString('assets/restaurants.json');
//     final Gamiss dataRest = restaurantFromJson(response);
//     // print(dataRest.restaurants[0].name);

//     setState(() {
//       data = dataRest.restaurants
//           .where((element) =>
//               element.name
//                   .toLowerCase()
//                   .contains(widget.keyword.toLowerCase()) ||
//               element.city
//                   .toLowerCase()
//                   .contains(widget.keyword.toLowerCase()) ||
//               element.menus.foods
//                       .where((element2) => element2.name
//                           .toLowerCase()
//                           .contains(widget.keyword.toLowerCase()))
//                       .length !=
//                   0)
//           .toList();
//     });
//   }

//   @override
//   void initState() {
//     readData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Hasil Pencaharian"),
//         ),
//         body: data.length != 0
//             ? ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(data[index].pictureId),
//                     ),
//                     title: Text(data[index].name),
//                     subtitle: Text(data[index].city),
//                     trailing: Text(data[index].rating.toString()),
//                   );
//                 })
//             : Column(
//                 children: [
//                   Padding(padding: EdgeInsets.only(top: 80)),
//                   Center(child: Text(" 404 | Not Found")),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text("Tembolok required")
//                 ],
//               ));
//   }
// }
