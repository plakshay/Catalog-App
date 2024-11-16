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
    var catalogJson =await rootBundle.loadString("assets/files/catalog.json"); // this is used to read the data from the json files in the form of strings
    // loadstring is a future method so it might take time therefore we use await 

    // json decode - conversion of string json data to different format
    // json encode - conversion of other format data to string format

    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData ["products"];
    print (productData);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList= List.generate(10, (index)=>catalogModel.items[0]);
    return  Scaffold(
          appBar: AppBar(
            title: Text("Catalog App",),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: dummyList.length,
              itemBuilder: (context,index){ // it represents how the item will be displayed on the screen 
                return ItemWidget( item: dummyList[index], );
              },
            ),
          ),
        drawer: MyDrawer(),
        );
}
}