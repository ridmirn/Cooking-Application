import 'package:flutter/material.dart';
//import 'package:newflutterproject/models/Food_items.dart';
import 'package:newflutterproject/screens/recipe_detail_screen.dart';
import 'package:newflutterproject/widgets/recipe_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:newflutterproject/assests';

class HomePage extends StatefulWidget{
  @override 
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State <HomePage> {
   //List<dynamic> ingridents = [];
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Food Recipes'),
        ],
      ),
    ),
    body:StreamBuilder(
     stream: FirebaseFirestore.instance.collection('Food_items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return Center(
              child: Text('Loading'),
            );
          }

          // List<dynamic> ingridents = [];
          //   snapshot.data!.docs.forEach((doc) {
          //   if (doc.exists) {
            
          //     (doc['ingridents'].toString());
          //   }
          // });
          return ListView(
            children: snapshot.data!.docs.map((doc){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetails(doc['foodname'].toString(),doc['image'], doc['servings'], doc['ingridents'].cast<String>(), doc['steps'].cast<String>())));
                },

                child: RecipeCard(
                    title:(doc['foodname'].toString()),
                    thumbnailUrl:(doc['image']),
                ),
              );
            }).toList(),
            
        
          );
        },
    ),
    );
  }
}
