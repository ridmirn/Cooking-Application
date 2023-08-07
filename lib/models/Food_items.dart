//import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  late String id;
 late  String name;
  late String image;

  Food();

  Food.fromMap(Map<String, dynamic> data){
    id = data['id'];
    name = data['foodname'];
    image = data['image'];
  }
   Map<String, dynamic>toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
     
    };
  }
}