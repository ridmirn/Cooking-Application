// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:newflutterproject/screens/widgets/recipe_card.dart';

// class ItemList extends StatelessWidget{
//   ItemList({Key? key}) : super(key: key){
//     _stream = _reference.snapshots();
//   }

//   CollectionReference _reference =
//   FirebaseFirestore.instance.collection('Food_items');

//   late Stream<QuerySnapshot> _stream;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Items Name'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _stream,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasError){
//             return Center(child: Text('Some error ${snapshot.error}'));
//           }

//           if(snapshot.hasData){
//             QuerySnapshot querySnapshot = snapshot.data;
//             List<QueryDocumentSnapshot> documents  = querySnapshot.docs;

//             List<Map> items = documents.map((e) => e.data() as Map).toList();

//             return ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (BuildContext context, int index){

//                 Map thisItem = items[index];
//                 return ListTile(
//                  // title:(thisItem['foodname'].toString()),
//                   leading: Container(
//                     width: 250,
//                     height: 250,

//                   child :  thisItem.containsKey('image')?Image.network('${thisItem['image']}'): Container(),
//                   )
                  
//                 );
              
//           });
//           }
//           return Center(child: CircularProgressIndicator());

//         }

//       ),
//     );
//   }
// }