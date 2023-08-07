import 'package:flutter/material.dart';
import 'package:newflutterproject/widgets/recipe_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:newflutterproject/assests';

class HomePage extends StatefulWidget{
  @override 
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State <HomePage> {
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

          return ListView(
            children: snapshot.data!.docs.map((doc){
              return RecipeCard(
                  title:(doc['foodname'].toString()),
                  thumbnailUrl:(doc['image']),
                
              );
            }).toList(),

          );
        },
    ),
    );
  }
}
