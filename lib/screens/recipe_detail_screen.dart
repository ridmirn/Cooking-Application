import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflutterproject/models/Food_items.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/button.dart';

//import '../models/Food_items.dart';

class RecipeDetails extends StatelessWidget {

final String title;
final String image;
final String servings;
//List<String> ingridents = [];
//final String ingridents;
final List<String> ingridents;
final List<String> steps;

RecipeDetails(this.title, this.image, this.servings, this.ingridents, this.steps);
 
  
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: (size.height / 2),
        maxHeight: (size.height/ 1.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,    
               //child: Hero(
               // tag: Food.image,
                 child: Image(
                      height: (size.height / 2) + 50,
                      width: double.infinity,
                      fit: BoxFit.cover,
                       //image: AssetImage("assests/image2.png" ),
                       image: NetworkImage(image),
                    ),
               //),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(
                    0.3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    ),
                ),
              ),
               SizedBox(
                height: 30,
              ),
               Text(title,
               style: _textTheme.titleMedium,
               ),
                SizedBox(
                height: 10,
              ),
               Text(servings + " Servings",
               style: _textTheme.titleSmall,
               ),
               SizedBox(
                height: 10,
               ),
              
               Divider(
                color: Colors.black.withOpacity(0.3),
               ),
               Expanded(child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      tabs: [
                      Tab(text: "Ingridents".toUpperCase(),
                      ),
                      Tab(text: "Preparation".toUpperCase(),
                      ),
                    ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          //Ingridents(ingridents: ingridents),
                           ListView.builder(
                            itemCount: ingridents.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(ingridents[index],
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),),
                              );
                            },

                           ),
                            ListView.builder(
                              itemCount: steps.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(steps[index],
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),),
                                );
                              },
                            )
                          //   ListView.builder(
                          //   itemCount: preparation.length,
                          //   itemBuilder: (context, index) {
                          //     return ListTile(
                          //       title: Text(preparation[index],
                          //       style: TextStyle(
                          //         color: Colors.green,
                          //         fontSize: 16,
                          //       ),),
                          //     );
                          //   },

                          //  ),
                        
                        ],
                        ),
                        ),

                  ],),
               ))
            ],
            
          ),
        ),

      ),


    );


  }
}

// class Ingridents extends StatefulWidget{
//   @override
//   _Ingridents createState() => _Ingridents();
// }

// class _Ingridents extends State <Ingridents> {
//   List<dynamic> ingridents = [];

//   @override 
//   void initState(){
//     super.initState();
//     fetchDataFromFirebase();
//   }

//   Future<void> fetchDataFromFirebase() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//     .collection('Food_items')
//     .get();

//     if (querySnapshot.docs.isNotEmpty){
//       ingridents = querySnapshot.docs[0]['ingridents'];
//     }

//     // for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
//     //   if (docSnapshot.exists){
//     //     ingridents.addAll(docSnapshot['ingridents']);
//     //   }
//     // }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context){
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ListView.separated(
//             shrinkWrap: true,
//             itemCount: ingridents.length,
//             separatorBuilder: (BuildContext context, int index){
//               return Divider(
//                 color: Colors.black.withOpacity(0.3),
//               );
//             },
//             itemBuilder: (BuildContext context, int index){
//               return Text(ingridents[index]);
//             },
//           )
          
//         ],
//       ),
//     );
//   }
// }
// class Ingridents extends StatelessWidget {
// final String ingridents;
// Ingridents({
//   required this.ingridents,
// });

// @override
// Widget build(BuildContext context){
//   return SingleChildScrollView(
//    child: Column(
//       children: [
//         ListView.separated(
//           shrinkWrap: true,
//           itemCount: ingridents.length,
//           separatorBuilder: (BuildContext context, int index){
//             return Divider(
//               color: Colors.black.withOpacity(0.3),
//             );
//           },
//           itemBuilder: (BuildContext context, int index){
//             return Text(ingridents[index]);
//           },
//         )
//       ]),
//   );
  
// }

// }