import 'package:flutter/material.dart';
import 'package:target10days/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) 
  : assert(item != null);
  // assert is a conditional statement which is used to check whether the item that is added is null or not

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.asset("assets/images/pfp.jpg"), //left of the screen 
        title: Text(item.name),//dynamic item name
        subtitle: Text("nice product"),
        trailing: Text("\$ ${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),),// right of the screen
      ),
    );
  }
}