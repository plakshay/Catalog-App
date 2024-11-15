import 'package:flutter/material.dart';
import 'package:target10days/models/catalog.dart';
import 'package:target10days/widgets/drawer.dart';

import '../widgets/item_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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