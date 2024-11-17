import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; // this gives json decoder and encoder so that we can read the data from the json and map it according to needs
import 'package:target10days/models/catalog.dart';
import 'package:target10days/widgets/drawer.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
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
      backgroundColor: MyTheme.creamColor,
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
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )  
              ],
            ),
          ),
        )
        );
}
}


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 Text("Catalog App",
                 style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 16, 0, 96),
                 ),
                ),
                Text("Trending Products")
              ],
            );
  }
}



class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //With shrinkWrap: true, you can change this behavior so that the ListView only occupies the space it needs (it will still scroll when there more items).
        itemCount: catalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = catalogModel.items[index];
          return CatalogItem (
            catalog :catalog
            );
        },
    );
  }
}



class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({ Key? key, required this.catalog}): 
  assert(catalog!=null) ,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.lg.color(MyTheme.darkblueColor).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                SizedBox(
                  height: 20
                  ,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$ ${catalog.price}".text.bold.xl.make(),
                    ElevatedButton( 
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: MyTheme.darkblueColor,
                        
                      ),
                    onPressed: () {
                      print("hi");
                    }, child: "Buy".text.white.make())
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ) 

        ],
        
      )
    ).white.roundedLg.square(150).make().py16(); // vx code box made, works same as the container 
  }
}


class CatalogImage extends StatelessWidget {

  final String image;

  const CatalogImage({super.key, required this.image});
 
  
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p16// padding that comes insisde
          .color(MyTheme.creamColor).make().p16().
          w40(context);// padding that comes outside
          // box.make is same as wrapping the image with a container
  }
}