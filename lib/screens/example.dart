// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class FetchData extends StatelessWidget {
  
//   final ref = FirebaseDatabase.instance.ref('sensordata');
//   //List <dynamic> dataList = [];

//   @override
//   Widget build(BuildContext context){
//   return Scaffold(
//     appBar: AppBar(title: const Text('data new')
//     ),
//     body: Stack(
      
//         children:[
//           Positioned(
//             top: 20,
//             left: 20,
//             child: Text('Fish Curry',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontFamily: GoogleFonts.amaranth().fontFamily,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//            Positioned(
//             top: 50,
//             left: 20,
//             child: Text(
//               'Please select your preferred spiciness level',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: GoogleFonts.amaranth().fontFamily,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black.withOpacity(0.3),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 100,
//             left: 20,
//           child: FirebaseAnimatedList(query: ref, itemBuilder: (context, Snapshot, animation, index){
//           return ListTile(
//             title: Text(Snapshot.child('Salt').value.toString()),
//            // subtitle: Text(Snapshot.child('Temp').value.toString()),
//           );

//         }))

//         ]
        
        

//     )
   

  
//   );}

//   }    


import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FetchData extends StatelessWidget {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref();

  Stream<Map<dynamic, dynamic>> getDataStream() {
    return _databaseReference.child('sensordata').onValue
        .map((event) => event.snapshot.value as Map<dynamic, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Data with StreamBuilder'),
      ),
      body: StreamBuilder<Map<dynamic, dynamic>>(
        stream: getDataStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String data1 = snapshot.data!['Salt'] ?? '';
            String data2 = snapshot.data!['obj'] ?? '';

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Data 1: $data1', style: TextStyle(color:Colors.black),),
                  Text('Data 2: $data2',style: TextStyle(color:Colors.black)),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data: ${snapshot.error}', style: TextStyle(color: Colors.black),),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
