import 'package:flutter/material.dart';
import 'package:target10days/models/catalog.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';




class HomeDetailsPage extends StatelessWidget {

  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}):assert (catalog!=null), super(key: key); // key? key -> null safety error in flutter



  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor ,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$ ${catalog.price}".text.red800.bold.xl4.make(),
                      ElevatedButton( 
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: MyTheme.darkblueColor,
                          
                        ),
                      onPressed: () {
                        
                      }, child: "Buy".text.white.make()).wh(100, 50)
                    ],
        ).p32(),
      ),
      body: SafeArea(
        bottom : false,
        child: Column( 
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network
              (catalog.image),
              ).h32(context),
              Expanded (
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.bold.xl4.color(MyTheme.darkblueColor).make(),
                        catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ).py64(),
                  ),
                ),), 
          ],
        ),
      ),
    );
  }
}