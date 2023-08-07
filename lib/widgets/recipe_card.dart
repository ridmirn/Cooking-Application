//import 'package:cached_network_image/src/cached_image_widget.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {

  final String title;
  //final String cooktime;
final String thumbnailUrl;
  //final String rating;

  RecipeCard({
    required this.title,
    //required this.cooktime,
   required this.thumbnailUrl
    //required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0),
            BlendMode.multiply,
          ),
        image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),

   
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
            
              padding: EdgeInsets.all(3),
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),

              color: Colors.grey.withOpacity(0.5),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                 
                  fontFamily: 'Poppins',
               
                ),
                textAlign: TextAlign.center,
               
              ) ,
              
              alignment: Alignment.center,
            ),
          ),

        ],
      )
    
    );
  }
}