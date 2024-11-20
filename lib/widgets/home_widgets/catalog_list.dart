import 'package:flutter/material.dart';
import 'package:target10days/models/catalog.dart';
import 'package:target10days/screens/home_detail_page.dart';
import 'package:target10days/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';
import '../themes.dart';



class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //With shrinkWrap: true, you can change this behavior so that the ListView only occupies the space it needs (it will still scroll when there more items).
        itemCount: catalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = catalogModel.items[index];
          return InkWell(
            onTap: ()=> Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailsPage(catalog: catalog), 
                )
            ),
            child: CatalogItem (
              catalog :catalog
              ),
          );
        },
    );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;
   CatalogItem({ Key? key, required this.catalog}): 
  assert(catalog!=null) ,
  super(key: key);

  @override
  
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;
    return VxBox(
      child: Row(
        children: [
          Hero( // shared transitions 
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.lg.color(accentColor).make(),
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
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: MyTheme.darkblueColor,
                        
                      ),
                    onPressed: () {
                      
                    }, child: "Buy".text.white.make())
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ) 

        ],
        
      )
    ).color(context.cardColor).roundedLg.square(150).make().py16(); // vx code box made, works same as the container 
  }
}