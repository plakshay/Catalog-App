import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; // this gives json decoder and encoder so that we can read the data from the json and map it according to needs
import 'package:target10days/models/catalog.dart';
import 'package:target10days/utils/routes.dart';
import 'package:target10days/widgets/home_widgets/catalog_header.dart';
import 'package:target10days/widgets/home_widgets/catalog_list.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


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
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: Material(
          color: MyTheme.darkblueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32), // Apply border radius
          ),
          child: FloatingActionButton(
            onPressed: () =>  Navigator.pushNamed(context,MyRoutes.cartRoute), // on pressing the button it will take to the cart Page, usage of navigator
            backgroundColor: Colors.transparent, // Set background color as transparent
            child: Icon(CupertinoIcons.cart, color: Colors.white),
          ),
        ),
          // appBar: AppBar(
          //   title: Text("Catalog App",),
          //   centerTitle: true,
          // ),
        //   body: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: (catalogModel.items!=null && catalogModel.items.isNotEmpty)?

        //     // ListView.builder(
        //     //   itemCount: catalogModel.items.length,
        //     //   itemBuilder: (context,index){ // it represents how the item will be displayed on the screen 
        //     //     return ItemWidget( item: catalogModel.items[index], );
        //     //   },
        //     // ) now we will use grid view builder

        //     GridView.builder(
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // ratt lo
        //         crossAxisCount: 2, // crossaxiscount is used to tell number of items in a row( if row -> vertical, column -> horizontal (opp))
        //         mainAxisSpacing: 16,
        //         crossAxisSpacing: 16
        //         ),  // it is used to tell how many items are to be put in a row
        //       itemBuilder: (context,index){
        //         final item = catalogModel.items[index];
        //         return Card(
        //           clipBehavior: Clip.antiAlias,
        //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //           child: GridTile(
        //             header: Container(
        //               child: Text(item.name,
        //               style: TextStyle(
        //                 color: Colors.white,
        //               ),),
        //               padding: EdgeInsets.all(12),
        //               decoration: BoxDecoration(
        //                 color: Colors.deepPurple
        //               ),
        //               ),

        //             child: Image.network(item.image),

        //             footer: Container(
        //               child: Text("\$ ${item.price.toString()}",
        //               style: TextStyle(
        //                 color: Colors.white,
        //               ),),
        //               padding: EdgeInsets.all(12),
        //               decoration: BoxDecoration(
        //                 color: Colors.black
        //               ),
        //               ),
        //             )
        //           );
        //       },

        //       itemCount: catalogModel.items.length,
        //       ):Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   ),


        // drawer: MyDrawer(),

        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if(catalogModel.items!= null && catalogModel.items.isNotEmpty )
                  CatalogList().py16().expand()
                else
                   CircularProgressIndicator().centered().py20().expand(),// expand is used in order to make it in center
                  
              ],
            ),
          ),
        )
        );
}
}

