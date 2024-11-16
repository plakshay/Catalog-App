import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; // this gives json decoder and encoder so that we can read the data from the json and map it according to needs
import 'package:target10days/models/catalog.dart';
import 'package:target10days/widgets/drawer.dart';

import '../widgets/item_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState(); // this is used because we can fetch data before the build method has been called
    loadData();// to load the data from the file stored in assets
  }

  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    var catalogJson =await rootBundle.loadString("assets/files/catalog.json"); // this is used to read the data from the json files in the form of strings
    // loadstring is a future method so it might take time therefore we use await 

    // json decode - conversion of string json data to different format
    // json encode - conversion of other format data to string format

    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData ["products"];
    catalogModel.items = 
    List.from(productData).
    map<Item>((item)=> //item is the name of the map
    Item.fromMap(item)).
    toList(); 
    // list (from product data) -> map with the catalog model -> convert the mapping again to list
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
          appBar: AppBar(
            title: Text("Catalog App",),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: (catalogModel.items!=null && catalogModel.items.isNotEmpty)?ListView.builder(
              itemCount: catalogModel.items.length,
              itemBuilder: (context,index){ // it represents how the item will be displayed on the screen 
                return ItemWidget( item: catalogModel.items[index], );
              },
            ) 
            :Center(
              child: CircularProgressIndicator(),
            ),
          ),
        drawer: MyDrawer(),
        );
}
}