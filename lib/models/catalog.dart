// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class catalogModel{

  static final CatalogModel = catalogModel._internal(); // singleton class model, it is created when the model is created multiple times in a code so that when we call a class, the same model is called and it doesnt refresh the complete things

  catalogModel._internal();
  factory catalogModel()=> CatalogModel; // factory is a constructor that returns the instance of an existing class instead of creating a new one



  static List<Item> items=[];
    // Item(
    //   id: 1,
    //   name: "Mi 11",
    //   desc: "Xiaomi Mi 11 256GB",
    //   price: 749,
    //   color: "#ffa500",
    //   image: "https://example.com/images/mi11.png"
    // ) IRL this is generally empty


    // Get item by ID   
    Item getById(int id) => // function has been created from which the item will be selected whose id will be passed as the parameter
      items.firstWhere((element)=> element.id==id, orElse: null);

    // Get item by position
    Item getByPosition(int pos) => items[pos];  
  
}
class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({ // default constructor 
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

// named constructor syntanx - > Item.namedConstructor() {}
    // Named constructor }

  // factory Item.fromMap(Map<String,dynamic> map){ // factory - it is used to choose between 2 constructors when a method is called, Map<key, value> therefore the key we have is string the value of that string is dynamic(string,num, int etc)
  //  // factory is used to create a constructor that doesn’t always create a new instance of a class.
  //  // it helps to choose which object is to be called, it acts as a smart constructor (existing object can also be called)
  //   return Item(
  //   id:    map["id"], 
  //   name:  map["name"], 
  //   desc:  map["desc"], 
  //   price: map["price"], 
  //   color: map["color"], 
  //   image: map["image"]
  //   );
  // } // decode the data from json, mapping is done for all the fields

  // toMap() =>{
  //   "id" : id, //key : value
  //   "name" : name,
  //   "desc" : desc,
  //   "price" : price,
  //   "color" : color,
  //   "image" : image,
  // }; // this is used to make map from the string we got


  // now we will use the package we installed - dart data generator to make it automatically

  

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.color == color &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode;
  }
} 

  
  