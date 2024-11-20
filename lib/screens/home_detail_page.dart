import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target10days/models/catalog.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';




class HomeDetailsPage extends StatelessWidget {

  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}):assert (catalog!=null), super(key: key); // key? key -> null safety error in flutter



  @override 
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //   statusBarColor: Colors.transparent, // Make status bar background transparent
    //   statusBarIconBrightness: Brightness.dark, // Ensure the icons/text are dark (black)
    // ));
    final accentColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor ,
      bottomNavigationBar: Container(
        color:context.cardColor,
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
                        
                      }, child: "Add to Cart".text.white.make()).wh(125, 45)
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
              (catalog.image).p16(),
              ).h32(context),
              Expanded (
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.bold.xl4.color(accentColor).make(),
                        catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                        SizedBox(
                          height: 20,
                        ),
                        "Vero vero ut est ut accusam diam et est sit. Diam erat stet sed ipsum lorem tempor, ea et no et sanctus eirmod sit ipsum, ipsum vero lorem est justo dolor duo clita, et consetetur rebum aliquyam labore. Sed erat nonumy et dolor accusam ipsum sanctus dolor dolor, elitr labore.".
                        text.textStyle(context.captionStyle).make().p16(),
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