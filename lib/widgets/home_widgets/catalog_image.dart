import 'package:flutter/material.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



class CatalogImage extends StatelessWidget {

  final String image;

  const CatalogImage({super.key, required this.image});
 
  
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p16// padding that comes insisde
          .color(context.canvasColor).make().p16().
          w40(context);// padding that comes outside
          // box.make is same as wrapping the image with a container
  }
}